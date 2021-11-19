package com.capstone.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.capstone.service.impl.DiseaseService;

@Controller
public class HomeController extends BaseController{
	
	@Autowired
	DiseaseService disease;
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	ModelAndView Init(HttpSession session, HttpServletRequest request) {	
		String previous = request.getRequestURI().replace("/diso-capstone", "");
		session.setAttribute("previous", previous);
		_mv.setViewName("web/home");
		return _mv;
	}
	
	@RequestMapping(value = "/identify", method = RequestMethod.GET)
	ModelAndView diseasePage(HttpSession session,HttpServletRequest request) {
		String previous = request.getRequestURI().replace("/diso-capstone", "");
		session.setAttribute("previous", previous);
		_mv.setViewName("web/disease-identification");
		return _mv;
	}
	
	@RequestMapping(value = "/identify/{id}", method = RequestMethod.GET)
	ModelAndView diseaseInfoPage(@PathVariable int id, HttpSession session,HttpServletRequest request) {
		String previous = request.getRequestURI().replace("/diso-capstone", "");
		session.setAttribute("previous", previous);
		_mv.addObject("disease", disease.getDataDiseaseById(id));
		_mv.setViewName("web/disease-info");
		return _mv;
	}
}
