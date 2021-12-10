package com.capstone.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.controller.BaseController;
import com.capstone.dto.PostDTO;
import com.capstone.entity.UserEntity;
import com.capstone.service.impl.AccountService;
import com.capstone.service.impl.PostService;

@Controller("adminCommtroler")
public class HomeController extends BaseController{
	
	@Autowired
	public AccountService accountService;
	
	@Autowired
	public PostService postService;
	
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	ModelAndView Init(HttpSession session, HttpServletRequest request) {
		List<UserEntity> accounts = accountService.findAll();
		_mv.addObject("accounts", accounts);
		_mv.setViewName("admin/home");
		return _mv;
	}
	
	@RequestMapping(value = "/admin/post", method = RequestMethod.GET)
	ModelAndView postPage(HttpSession session, HttpServletRequest request) {
		List<PostDTO> posts = postService.getDataPost();
		_mv.addObject("posts", posts);
		_mv.setViewName("admin/post-table");
		return _mv;
	}
}
