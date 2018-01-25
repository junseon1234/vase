package com.java.pjt.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.pjt.bean.DaoBean;
import com.java.pjt.dao.DaoInterface;

@Service
public class Services implements ServicesInterface {

	@Autowired
	DaoInterface di;

	private final String ns = "user";
	private HashMap<String, Object> result;
	private DaoBean bean;
	private HashMap<String, Object> dummy = new HashMap<String, Object>();
	
	@Override
	public HashMap<String, Object> test() {
		dummy.put("test", "test");
		bean = new DaoBean("SelectOne", "sql.test", dummy);
		result = (HashMap<String, Object>) di.dao(bean);
		return result;
	}
	
	@Override
	public HashMap<String, Object> notice() {
		dummy.put("dummy", "dummy");
		result = new HashMap<String, Object>();
		bean = new DaoBean("SelectList", "sql.notice", dummy);
		result.put("list", di.dao(bean));
		return result;
	}
	
	@Override
	public HashMap<String, Object> noticedetail(HashMap<String, Object> param) {
		bean = new DaoBean("SelectOne", "sql.noticedetail", param);
		result = (HashMap<String, Object>) di.dao(bean);
		return result;
	}
	
	@Override
	public HashMap<String, Object> item(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("SelectList", "sql.item", param);
		result.put("list", di.dao(bean));
		return result;
	}

	@Override
	public HashMap<String, Object> itemdetail(HashMap<String, Object> param) {
		bean = new DaoBean("SelectOne", "sql.itemdetail", param);
		result = (HashMap<String, Object>) di.dao(bean);
		return result;
	}

	@Override
	public HashMap<String, Object> iddupe(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("SelectOne", "sql.iddupe", param);
		result.put("profile",di.dao(bean));
		bean = new DaoBean("SelectList", "sql.buylist", param);
		result.put("orders",di.dao(bean));
		return result;
	}
	
	@Override
	public HashMap<String, Object> signin(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		param.put("UserBirthday", param.get("birth1") + "-" + param.get("birth2") + "-" + param.get("birth3"));
		param.put("UserEmail", param.get("Email1") + "@" + param.get("Email2"));
		param.put("UserPhone", param.get("Phone1") + "-" + param.get("Phone2") + "-" + param.get("Phone3"));
		bean = new DaoBean("Insert", "sql.signin", param);
		result.put("status", di.dao(bean));
		return result;
	}

	@Override
	public HashMap<String, Object> login(HashMap<String, Object> param) {
		bean = new DaoBean("SelectOne", "sql.login", param);
		result = (HashMap<String, Object>) di.dao(bean);
		return result;
	}

	public HashMap<String, Object> qa(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("Insert", "sql.qa", param);
		result.put("status", di.dao(bean));
		return result;
	}

	@Override
	public HashMap<String, Object> basketin(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("SelectOne", "sql.basketsel", param);
		HashMap<String, Object> check = (HashMap<String, Object>) di.dao(bean);
		System.out.println(check);
		if(check == null){
			bean = new DaoBean("Insert", "sql.basketin", param);
		}
		result.put("status", di.dao(bean));
		return result;
	}

	@Override
	public HashMap<String, Object> basketselect(HashMap<String, Object> param) {
		bean = new DaoBean("SelectOne", "sql.basketsel", param);
		result = (HashMap<String, Object>) di.dao(bean);
		return result;
	}
	
	@Override
	public HashMap<String, Object> basketlist(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("SelectList", "sql.basketlist", param);
		result.put("list", di.dao(bean));
		bean = new DaoBean("Update", "sql.basketreset", param);
		result.put("status", di.dao(bean));
		return result;
	}
	
	@Override
	public HashMap<String, Object> basketbuy(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("Update", "basketbuy", param);
		result.put("status", di.dao(bean));
		return result;
	}
	
	@Override
	public HashMap<String, Object> basketdel(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("Update", "basketdel", param);
		result.put("status", di.dao(bean));
		return result;
	}
	
	@Override
	public HashMap<String, Object> orderlist(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("SelectList", "sql.orderlist", param);
		result.put("list", di.dao(bean));
		bean = new DaoBean("SelectList", "sql.iddupe", param);
		result.put("user", di.dao(bean));
		return result;
	}
	
	@Override
	public HashMap<String, Object> orderbuy(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		param.put("OrderAddr", param.get("OrderAddr1") + " " + param.get("OrderAddr2"));
		param.put("TakerAddr", param.get("TakerAddr1") + " " + param.get("TakerAddr2"));
		bean = new DaoBean("Insert", "sql.orderbuy", param);
		result.put("status1", di.dao(bean));
		param.put("id", param.get("OrderID"));
		param.put("item", param.get("OrderItem"));
		bean = new DaoBean("Update", "sql.basketdel", param);
		result.put("status2", di.dao(bean));
		if(param.get("id").toString() != "비로그인"){
			bean = new DaoBean("Update", "sql.pointup", param);
			result.put("status3", di.dao(bean));
		}
		return result;
	}

	@Override
	public HashMap<String, Object> ordersearch(HashMap<String, Object> param) {
		result = new HashMap<String, Object>();
		bean = new DaoBean("SelectList", "sql.buypw", param);
		result.put("list", di.dao(bean));
		return result;
	}
}
