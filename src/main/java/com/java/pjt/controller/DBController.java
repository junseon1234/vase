package com.java.pjt.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.pjt.service.ServicesInterface;
import com.java.pjt.util.HttpUtil;

@Controller
public class DBController {
	
	@Autowired
	ServicesInterface si;
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public ModelAndView DBTest(HttpServletRequest req){
		return HttpUtil.returnJson(si.test());
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.POST)
	public ModelAndView notice(HttpServletRequest req){
		return HttpUtil.returnJson(si.notice());
	}
	
	@RequestMapping(value = "/noticedetail", method = RequestMethod.POST)
	public ModelAndView noticedetail(HttpServletRequest req){
		return HttpUtil.returnJson(si.noticedetail(HttpUtil.paramMap(req)));
	}
	
	@RequestMapping(value = "/item", method = RequestMethod.POST)
	public ModelAndView item(HttpServletRequest req){
		return HttpUtil.returnJson(si.item(HttpUtil.paramMap(req)));
	}
	
	@RequestMapping(value = "/itemdetail", method = RequestMethod.POST)
	public ModelAndView itemdetail(HttpServletRequest req){
		return HttpUtil.returnJson(si.itemdetail(HttpUtil.paramMap(req)));
	}
	
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public ModelAndView signin(HttpServletRequest req, ModelAndView mav){
		HashMap<String, Object> param = HttpUtil.paramMap(req);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result = si.signin(param);
		System.out.println(Integer.parseInt(result.get("status").toString()));
		if(Integer.parseInt(result.get("status").toString())==1){
			mav.setViewName("login/signinsuccess");
		} else {
			mav.setViewName("login/signinfailed");
		}
		return mav;
	}
	
	@RequestMapping(value = "/ordersearching", method = RequestMethod.POST)
	public ModelAndView ordersearching(HttpServletRequest req, ModelAndView mav){
		HashMap<String, Object> param = HttpUtil.paramMap(req);
		HashMap<String, Object> result = new HashMap<String, Object>();
		List<HashMap<String, Object>> List;
		result = si.ordersearch(param);
		
		List = (java.util.List<HashMap<String, Object>>) result.get("list");
		System.out.println(List.size());
		
		if(List.size()>0){
			mav.setViewName("login/searchsuccess");
			mav.addObject("Orders", si.ordersearch(param));
		} else {
			mav.setViewName("login/searchfailed");
		}
		return mav;
	}
	
	@RequestMapping(value = "/iddupe", method = RequestMethod.POST)
	public ModelAndView iddupe(HttpServletRequest req){
		return HttpUtil.returnJson(si.iddupe(HttpUtil.paramMap(req)));
	}

	
	@RequestMapping(value = "/qain", method = RequestMethod.POST)
	public ModelAndView qain(HttpServletRequest req, ModelAndView mav){
		HttpUtil.returnJson(si.qa(HttpUtil.paramMap(req)));
		mav.setViewName("login/qasuccess");
		return mav;
	}
	
	@RequestMapping(value = "/basketin", method = RequestMethod.POST)
	public ModelAndView basketin(HttpServletRequest req, ModelAndView mav){
		return HttpUtil.returnJson(si.basketin(HttpUtil.paramMap(req)));
	}
	
	@RequestMapping(value = "/basketlist", method = RequestMethod.POST)
	public ModelAndView basketlist(HttpServletRequest req, ModelAndView mav){
		return HttpUtil.returnJson(si.basketlist(HttpUtil.paramMap(req)));
	}
	
	@RequestMapping(value = "/basketbuy", method = RequestMethod.POST)
	public ModelAndView basketbuy(HttpServletRequest req, ModelAndView mav){
		return HttpUtil.returnJson(si.basketbuy(HttpUtil.paramMap(req)));
	}
	
	@RequestMapping(value = "/basketdel", method = RequestMethod.POST)
	public ModelAndView basketdel(HttpServletRequest req, ModelAndView mav){
		return HttpUtil.returnJson(si.basketdel(HttpUtil.paramMap(req)));
	}
	
	@RequestMapping(value = "/orderlist", method = RequestMethod.POST)
	public ModelAndView orderlist(HttpServletRequest req, ModelAndView mav){
		return HttpUtil.returnJson(si.orderlist(HttpUtil.paramMap(req)));
	}
	
	@RequestMapping(value = "/orderbuy", method = RequestMethod.POST)
	public ModelAndView orderbuy(HttpServletRequest req, ModelAndView mav){
		return HttpUtil.returnJson(si.orderbuy(HttpUtil.paramMap(req)));
	}
}
