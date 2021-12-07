package com.capstone.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.controller.BaseController;

@Controller("adminCommtroler")
public class HomeController extends BaseController{
	
	
	@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
	ModelAndView Init(HttpSession session, HttpServletRequest request) {	
		_mv.setViewName("admin/home");
		return _mv;
	}
}
