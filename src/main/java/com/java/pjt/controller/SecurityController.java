package com.java.pjt.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.pjt.util.HttpUtil;

@Controller
public class SecurityController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private String page;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(!(auth instanceof AnonymousAuthenticationToken)){
			UserDetails user = (UserDetails) auth.getPrincipal();
			logger.info("UserID : " + user.getUsername());
			page = "redirect:/index";
			//로그인 페이지 접근시 로그인이 확인되었을 때 이동
		} else {
			logger.info("Not Login");
			page = "login/login";
		}
		return page;
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public ModelAndView loginCheck(){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		if(auth instanceof AnonymousAuthenticationToken){
			//로그인되지 않았을 때
			result.put("status", 0);
		} else {
			//로그인되었을 때
			UserDetails user = (UserDetails) auth.getPrincipal();
			result.put("status", 1);
			result.put("msg", user.getAuthorities().toString());
		}
		return HttpUtil.returnJson(result);
	}
}
