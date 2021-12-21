package com.capstone.controller.admin;

import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.controller.BaseController;
import com.capstone.dto.PostDTO;
import com.capstone.entity.UserEntity;
import com.capstone.service.impl.AccountService;
import com.capstone.service.impl.PostService;
import com.capstone.utils.Email;
import com.capstone.utils.EmailUtils;

@Controller("adminCommtroler")
public class HomeController extends BaseController{
	
	@Autowired
	public AccountService accountService;
	
	@Autowired
	public PostService postService;
	
	static int count=0;
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	ModelAndView Init(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("adminInfo") == null) {
			_mv.setViewName("redirect:/loginAdmin");
			return _mv;
		}
		List<UserEntity> accounts = accountService.findAll();
		List<PostDTO> posts = postService.getDataPost();
		List<UserEntity> inactiveAccounts = accountService.findUnactiveAll();
		_mv.addObject("accounts", accounts);
		_mv.addObject("posts", posts);
		_mv.addObject("inactiveAccounts", inactiveAccounts);
		_mv.setViewName("admin/home");
		return _mv;
	}
	
	@RequestMapping(value = "/admin/post", method = RequestMethod.GET)
	ModelAndView postPage(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("adminInfo") == null) {
			_mv.setViewName("redirect:/loginAdmin");
			return _mv;
		}
		List<PostDTO> posts = postService.getDataPost();
		List<UserEntity> accounts = accountService.findAll();
		List<UserEntity> inactiveAccounts = accountService.findUnactiveAll();
		_mv.addObject("accounts", accounts);
		_mv.addObject("posts", posts);
		_mv.addObject("inactiveAccounts", inactiveAccounts);
		_mv.setViewName("admin/post-table");
		return _mv;
	}
	
	@RequestMapping(value = "/admin/inactive-account", method = RequestMethod.GET)
	ModelAndView inactiveAccountPage(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("adminInfo") == null) {
			_mv.setViewName("redirect:/loginAdmin");
			return _mv;
		}
		List<UserEntity> inactiveAccounts = accountService.findUnactiveAll();
		List<UserEntity> accounts = accountService.findAll();
		List<PostDTO> posts = postService.getDataPost();
		_mv.addObject("accounts", accounts);
		_mv.addObject("inactiveAccounts", inactiveAccounts);
		_mv.addObject("posts", posts);
		_mv.setViewName("admin/inactive-account-page");
		return _mv;
	}
	
	@RequestMapping(value = "/loginAdmin", method = RequestMethod.GET)
	ModelAndView loginPage(HttpSession session, HttpServletRequest request) {
		
		_mv.addObject("admin", new UserEntity());
		_mv.setViewName("admin/login");
		return _mv;
	}
	@RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)
	ModelAndView login(HttpSession session, HttpServletRequest request, ModelMap model) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		UserEntity admin = accountService.checkAdmin(userName, password);
		if(admin != null) {
			admin.setPassword("");
			_mv.setViewName("redirect:/admin/home");
			
			session.setAttribute("adminInfo", admin);
			
		}
		else {
			model.put("status", "Tài khoản hoặc mật khẩu không hợp lệ");
			_mv.setViewName("admin/login");
		}
		return _mv;
	}
	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("adminInfo");
		return "redirect:/loginAdmin";
		
	}
	
	@RequestMapping(value = "/loginAdmin/forgot-password", method = RequestMethod.GET)
	public ModelAndView forgotPwPage(HttpSession session, HttpServletRequest request) {
		_mv.setViewName("admin/forgot-password");
		return _mv;
		
	}
	@RequestMapping(value = "/loginAdmin/forgot-password", method = RequestMethod.POST)
	public ModelAndView forgotPw(HttpSession session, HttpServletRequest request ,ModelMap model) {
		String email = request.getParameter("email");
		UserEntity admin = accountService.getUserByUserEmail(email);
		if(admin == null) {
			model.put("status", "Tên đăng nhập hoặc Email không đúng");
			_mv.setViewName("admin/forgot-password");
		}
		else {
			Email mail = new Email();
			int verify = ThreadLocalRandom.current().nextInt(1000, 9999);
			mail.setFrom("nguyenhaivhien9.1@gmail.com");
			mail.setFromPassword("Haithanchet1");
			mail.setSubject("Xác nhận Email");
			mail.setTo(admin.getEmail());
			StringBuilder st = new StringBuilder();
			st.append("Chào ").append(admin.getFirstName()).append(" ").append(admin.getLastName()).append("<br>");
			st.append("Mã xác nhận của bản là:  " + verify + "<br>");
			st.append("Thân,<br>");
			st.append("Nguyen Hai");
			mail.setContent(st.toString());
			EmailUtils.send(mail);
			model.put("status", "Vui-lòng-kiểm-tra-email");
			session.setAttribute("verify", verify);
			session.setAttribute("email", admin.getEmail());
			_mv.setViewName("redirect:/loginAdmin/reset-password");
		}
		
		return _mv;
		
	}
	
	@RequestMapping(value = "/loginAdmin/reset-password", method = RequestMethod.GET)
	public ModelAndView resetPwPage(HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("verify") == null) {
			_mv.setViewName("redirect:/loginAdmin/forgot-password");
			return _mv;
		}
		_mv.setViewName("admin/reset-password");
		return _mv;
		
	}
	
	@RequestMapping(value = "/loginAdmin/reset-password", method = RequestMethod.POST)
	public ModelAndView resetPw(HttpSession session, HttpServletRequest request, ModelMap model) {
		int verify=0;
		try {
			verify =  Integer.parseInt(request.getParameter("verify"));
		} catch (Exception e) {
			model.put("status", "Mã xác nhận không đúng");
			count++;
			_mv.setViewName("admin/reset-password");
		}
		int verifySession = (int) session.getAttribute("verify");
		String email = (String) session.getAttribute("email");
		String newPw = request.getParameter("newPassword");
		String confirmPw = request.getParameter("confirmPassword");
		System.out.println(verify);
		System.out.println(verifySession);
		if(verify == verifySession) {
			if(newPw.equals(confirmPw)) {
				int result = accountService.changePasswordByEmail(newPw, email);
				if(result>0) {
					session.removeAttribute("verify");
					_mv.setViewName("redirect:/loginAdmin");
				}else {
					model.put("status", "Thất bại");
					count++;
					_mv.setViewName("admin/reset-password");
				}
			}else {
				model.put("status", "Xác nhận mật khẩu không đúng");
				count++;
				_mv.setViewName("admin/reset-password");
			}
		}else {
			model.put("status", "Mã xác nhận không đúng");
			count++;
			_mv.setViewName("admin/reset-password");
		}
		if(count == 3) {
			session.removeAttribute("verify");
			_mv.setViewName("redirect:/loginAdmin/forgot-password");
			model.put("status", "bạn đã nhập sai quá số lần cho phép");
			count=0;
		}
			
		
		
		return _mv;
		
	}
}
