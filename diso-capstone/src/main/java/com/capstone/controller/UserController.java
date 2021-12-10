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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.entity.UserEntity;
import com.capstone.service.impl.AccountService;
import com.capstone.utils.Email;
import com.capstone.utils.EmailUtils;
import com.cloudinary.Cloudinary;

@Controller
public class UserController extends BaseController{
	@Autowired
	AccountService accountService;
	
	@Autowired
	Cloudinary cloudinary;
	
	public static int count=0;
	
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
				model.put("status", "Tên tài khoản đã tồn tại!");
				_mv.setViewName("web/register");
				return _mv;
			}
			UserEntity email = accountService.getUserByUserEmail(user.getEmail());
			if(email != null) {
				model.put("status", "Email đã tồn tại!");
				_mv.setViewName("web/register");
				return _mv;
			}
			if(!user.getConfirmPassword().equals(user.getPassword())) {
				model.put("status", "Xác nhận mật khẩu thất bại!");
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
	public ModelAndView FindAccount(@ModelAttribute("user") UserEntity user 
			,ModelMap model
			,HttpSession session) {
		UserEntity acc = accountService.getUserByUserNameAndEmail(user.getUserName(), user.getEmail());
		if(acc == null) {
			model.put("status", "Tên đăng nhập hoặc Email không đúng");
			_mv.setViewName("web/forgot-password");
		}
		else {
			Email email = new Email();
			int verify = ThreadLocalRandom.current().nextInt(1000, 9999);
			email.setFrom("nguyenhaivhien9.1@gmail.com");
			email.setFromPassword("Haithanchet1");
			email.setSubject("Xác nhận Email");
			email.setTo(user.getEmail());
			StringBuilder st = new StringBuilder();
			st.append("Chào ").append(acc.getFirstName()).append(" ").append(acc.getLastName()).append("<br>");
//			st.append("Your password is ").append(acc.getPassword()).append("<br>");
//			st.append("<a href='http://localhost:8080/diso-capstone/change-password'><p>here</p></a><br>");
			st.append("Mã xác nhận của bản là:  " + verify + "<br>");
			st.append("Thân,<br>");
			st.append("Nguyen Hai");
			email.setContent(st.toString());
			EmailUtils.send(email);
			model.put("status", "Vui-lòng-kiểm-tra-email");
			session.setAttribute("verify", verify);
			session.setAttribute("username", user.getUserName());
			_mv.setViewName("redirect:/reset-password");
		}
		return _mv;
	}
	@RequestMapping(value = "/reset-password", method = RequestMethod.GET)
	public ModelAndView resetPasswordPage(HttpSession session) {
		if(session.getAttribute("verify") == null) {
			_mv.setViewName("redirect:/forgot-password");
			return _mv;
		}
		int verifySession = (int) session.getAttribute("verify");
		System.out.println(verifySession);
		_mv.addObject("user", new UserEntity());
		_mv.setViewName("web/reset-password");
		return _mv;
	}
	@RequestMapping(value = "/reset-password", method = RequestMethod.POST)
	public ModelAndView resetPassword(@ModelAttribute("user") UserEntity user
									, ModelMap model
									, HttpSession session
									, HttpServletRequest request) {
		int verify =  Integer.parseInt(request.getParameter("verify"));
		int verifySession = (int) session.getAttribute("verify");
		String username = (String) session.getAttribute("username");
		System.out.println(verify);
		System.out.println(verifySession);
		if(verify == verifySession) {
			if(user.getConfirmPassword().equals(user.getNewPassword())) {
				int result = accountService.changePasswordByUserName(user.getNewPassword(), username);
				if(result>0) {
					session.removeAttribute("verify");
					_mv.setViewName("redirect:/login");
				}else {
					model.put("status", "Thất bại");
					count++;
					_mv.setViewName("web/reset-password");
				}
			}else {
				model.put("status", "Xác nhận mật khẩu không đúng");
				count++;
				_mv.setViewName("web/reset-password");
			}
		}else {
			model.put("status", "Mã xác nhận không đúng");
			count++;
			_mv.setViewName("web/reset-password");
		}
		if(count == 3) {
			session.removeAttribute("verify");
			_mv.setViewName("web/forgot-password");
			model.put("status", "bạn đã nhập sai quá số lần cho phép");
			count=0;
		}
			
		
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
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView profilePage(HttpSession session,HttpServletRequest request, ModelMap model) {
		model.remove("status");
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
	@RequestMapping(value = "/profile", method = RequestMethod.POST)
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
//			_mv.setViewName("redirect:/profile/" + user.getId());
			_mv.setViewName("web/profile");
		}
		
		return _mv;
	}
//	@RequestMapping(value = "/profile", method = RequestMethod.PUT)
//	public ModelAndView updateAvatar(@ModelAttribute("user")  UserEntity user,ModelMap model,HttpSession session) {
//		int result=0;
//		if(!user.getFile().isEmpty()) {
//			try {
//				user.setAvatar(cloudinary.uploader().upload(user.getFile().getBytes(),
//						ObjectUtils.emptyMap())
//						.get("secure_url").toString());
//				result = accountService.updateAvatarByUserId(user.getAvatar(), user.getId());
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		if(result>0) {
//			model.put("status", "Cập nhập thành công");
//		}else {
//			model.put("status", "Cập nhập Thất bại");
//		}
//		_mv.setViewName("web/profile");
//		return _mv;
//	}
	
	
}
