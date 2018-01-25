package com.java.pjt.service;

import java.util.HashMap;

public interface ServicesInterface {
	public HashMap<String, Object> test();
	public HashMap<String, Object> notice();
	public HashMap<String, Object> noticedetail(HashMap<String, Object> param);
	public HashMap<String, Object> item(HashMap<String, Object> param);
	public HashMap<String, Object> itemdetail(HashMap<String, Object> param);
	public HashMap<String, Object> signin(HashMap<String, Object> param);
	public HashMap<String, Object> basketin(HashMap<String, Object> param);
	public HashMap<String, Object> basketselect(HashMap<String, Object> param);
	public HashMap<String, Object> iddupe(HashMap<String, Object> param);
	public HashMap<String, Object> qa(HashMap<String, Object> param);
	public HashMap<String, Object> login(HashMap<String, Object> param);
	public HashMap<String, Object> basketlist(HashMap<String, Object> param);
	public HashMap<String, Object> basketdel(HashMap<String, Object> param);
	public HashMap<String, Object> basketbuy(HashMap<String, Object> param);
	public HashMap<String, Object> orderlist(HashMap<String, Object> param);
	public HashMap<String, Object> orderbuy(HashMap<String, Object> param);
	public HashMap<String, Object> ordersearch(HashMap<String, Object> param);
}
