package com.capstone.controller;

import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.entity.UserEntity;
import com.capstone.service.impl.AccountService;
import com.capstone.utils.Email;
import com.capstone.utils.EmailUtils;

@Controller
public class UserController extends BaseController{
	@Autowired
	AccountService accountService;
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView RegisterPage() {
		_mv.setViewName("web/register");
		_mv.addObject("user", new UserEntity());
		return _mv;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView createAccount(@ModelAttribute("user") @Valid UserEntity user , ModelMap model, BindingResult result) {
		if(result.hasErrors()) {
		//	model.put("status", "dang ki that bai");
			_mv.setViewName("web/register");
		}
		else {
			UserEntity username = accountService.getUserByUsername(user.getUserName());
			if(username != null) {
				model.put("usenameErr", "Tên tài khoản đã tồn tại!");
				_mv.setViewName("web/register");
				return _mv;
			}
			UserEntity email = accountService.getUserByUserEmail(user.getEmail());
			if(email != null) {
				model.put("emailErr", "Email đã tồn tại!");
				_mv.setViewName("web/register");
				return _mv;
			}
			int count = accountService.addAccount(user);
			if(count > 0) {
				_mv.setViewName("redirect:/login");
			}
			else {
				model.put("status", "Đăng ký thất bại! ");
				_mv.setViewName("web/register");
			}
			
		}
		
		return _mv;
	}
	
	
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public ModelAndView forgotPasswordPage() {
		_mv.setViewName("web/forgot-password");
		_mv.addObject("user", new UserEntity());
		return _mv;
	}
	//chua fix
	@RequestMapping(value = "/forgot-password", method = RequestMethod.POST)
	public ModelAndView FindAccount(@ModelAttribute("user") UserEntity user) {
		UserEntity acc = accountService.getUserByUserNameAndEmail(user.getUserName(), user.getEmail());
		if(acc == null) {
			_mv.addObject("error", "Username or email is incorrect");
			
		}
		else {
			Email email = new Email();
			int a = ThreadLocalRandom.current().nextInt(1000, 9999);
			email.setFrom("nguyenhaivhien9.1@gmail.com");
			email.setFromPassword("Haithanchet1");
			email.setSubject("Forgot Password Function");
			email.setTo(user.getEmail());
			StringBuilder st = new StringBuilder();
			st.append("Dear ").append(acc.getFirstName()).append(" ").append(acc.getLastName()).append("<br>");
			st.append("You are used forgot password function . <br>");
			st.append("Your password is ").append(acc.getPassword()).append("<br>");
			st.append("<a href='http://localhost:8080/diso-capstone/change-password'><p>here</p></a><br>");
			st.append("Ma xac nhan cua ban la " + a + "<br>");
			st.append("Regards<br>");
			st.append("Nguyen Hai");
			email.setContent(st.toString());
			EmailUtils.send(email);
			_mv.addObject("status", "password sent to your email. pls check!!");
			
		}
		_mv.setViewName("web/forgot-password");
		return _mv;
	}
	@RequestMapping(value = "/change-password", method = RequestMethod.GET)
	public ModelAndView changePasswordPage() {
		_mv.setViewName("web/change-password");
		_mv.addObject("user", new UserEntity());
		return _mv;
	}
	
	@RequestMapping(value = "/change-password", method = RequestMethod.POST)
	public ModelAndView changePassword( @ModelAttribute("user") UserEntity user, ModelMap model, HttpSession session) {
		if(session.getAttribute("login") == null) {
			_mv.setViewName("redirect:/login");
			return _mv;
		}
		UserEntity u = (UserEntity) session.getAttribute("loginInfo");
		if(BCrypt.checkpw(user.getPassword(), u.getPassword()) == false) {
			model.put("status", "Mật Khẩu cũ không đúng");
			_mv.setViewName("web/profile");
			return _mv;
		}
		else {
//			String n = user.getNewPassword();
//			String c = user.getConfirmPassword();
			if(user.getNewPassword()==user.getConfirmPassword() == false) {
				model.put("status", "Mật khẩu xác nhận không trùng mật khẩu  ");
				_mv.setViewName("web/profile");
				return _mv;
			}else {
				user.setNewPassword(BCrypt.hashpw(user.getNewPassword(), BCrypt.gensalt(12)));
				int result = accountService.updatePasswordById(user.getNewPassword(), u.getId());
				if(result>0)
					_mv.setViewName("web/profile");
				else {
					model.put("status", "Có lỗi sảy ra, vui lòng quay lại sau");
					_mv.setViewName("web/profile");
				}
			}
		}
		return _mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		_mv.setViewName("web/login");
		_mv.addObject("user", new UserEntity());
		
		return _mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView checkAccount(HttpSession session, @ModelAttribute("user")  UserEntity user, BindingResult result,ModelMap model) {
		if(result.hasErrors()) {
			model.put("status", "Tài khoản hoặc mật khẩu không hợp lệ");
			_mv.setViewName("web/login");
		
		}
		else {
			user = accountService.checkAccount(user);
			if(user != null) {
				user.setPassword("");
				_mv.setViewName("redirect:" +(String) session.getAttribute("previous"));
				
				session.setAttribute("loginInfo", user);
				
			}
			else {
				model.put("status", "Tài khoản hoặc mật khẩu không hợp lệ");
				_mv.setViewName("web/login");
			}
		}
		
	//	entity = (UserEntity) session.getAttribute("loginInfo");
		return _mv;
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("loginInfo");
		return "redirect:" + request.getHeader("Referer");
		
	}
	
	@RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
	public ModelAndView profilePage(HttpSession session,HttpServletRequest request,@PathVariable long id ) {
		String previous = request.getRequestURI().replace("/diso-capstone", "");
		session.setAttribute("previous", previous);
		if(session.getAttribute("loginInfo") == null) {
			_mv.setViewName("redirect:/login");
			return _mv;
		}
		UserEntity userLogin =  (UserEntity) session.getAttribute("loginInfo");
		UserEntity user = accountService.getUserById(userLogin.getId());
		user.setPassword("");
		_mv.addObject("user", user);
		_mv.setViewName("web/profile");
		
		return _mv;
	}
//	@RequestMapping(value = "/profile/edit/{id}", method = RequestMethod.GET)
//	public ModelAndView editAccountPage(@PathVariable long id,HttpSession session,HttpServletRequest request) {
//		String previous = request.getRequestURI().replace("/diso-capstone", "");
//		session.setAttribute("previous", previous);
//		if(session.getAttribute("loginInfo") == null) {
//			_mv.setViewName("redirect:/login");
//			return _mv;
//		}
//		_mv.addObject("user", accountService.getUserById(id) );
//		_mv.setViewName("web/update-profile");
//		return _mv;
//	}
	@RequestMapping(value = "/edit/status", method = RequestMethod.POST)
	public ModelAndView edit(@ModelAttribute("user") UserEntity user
							, ModelMap model
							, HttpSession session) {
		int result = accountService.updateAccount(user);
		if(result > 0) {
			user.setPassword("");
			session.setAttribute("loginInfo", accountService.getUserById(user.getId()));
			model.put("status", "Cập nhập thành công");
		//	_mv.setViewName("redirect:/profile/" + user.getId());
			_mv.setViewName("web/profile");
		}
		else {
			model.put("status", "Cập Nhập thất bại!");
			_mv.setViewName("redirect:/profile/" + user.getId());
		}
		
		return _mv;
	}
	
	
}
