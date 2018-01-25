package com.java.pjt.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.pjt.bean.DaoBean;

@Repository
public class Dao implements DaoInterface {

	@Resource(name="sqlSession")
	SqlSession session;
	
	@Override
	public Object dao(DaoBean bean) {
		
		switch (bean.getType()) {
		case "SelectOne":
			return session.selectOne(bean.getSql(), bean.getParams());
		case "SelectList":
			return session.selectList(bean.getSql(), bean.getParams());
		case "Insert":
			return session.insert(bean.getSql(), bean.getParams());
		case "Update":
			return session.update(bean.getSql(), bean.getParams());
		}
		
		return null;
		
	}

}
