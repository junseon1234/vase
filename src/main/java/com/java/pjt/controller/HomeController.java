package com.java.pjt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String index(){
		return "index";
	}
	
	@RequestMapping("/loginsuccess")
	public String loginPage(){
		return "/login/loginsuccess";
	}
	
	@RequestMapping("/loginfailed")
	public String loginfailed(){
		return "/login/loginfailed";
	}
	
	@RequestMapping("/signin")
	public ModelAndView signin(ModelAndView mav){
		mav.setViewName("login/signin");
		return mav;
	}
	
	@RequestMapping("/ordersearch")
	public ModelAndView ordersearch(ModelAndView mav){
		mav.setViewName("login/ordersearch");
		return mav;
	}
}
