package com.kitri.jejusari.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImp implements MemberDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<String> testDB() {
		return session.selectList("member_id_check");
	}
	
	@Override
	public List<String> getScrapImg(String member_id) {
//		System.out.println(session.selectList("getScrapSalesNumber", member_id));
		return session.selectList("getImg", session.selectList("getScrapSalesNumber", member_id));
	}
	
	@Override
	public List<String> getSalesImg(String member_id) {
		return session.selectList("getImg", session.selectList("getSalesSalesNumber", member_id));
	}
	
}
