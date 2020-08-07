package com.kitri.jejusari.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDaoImp implements TestDao{
	
	// 테스트용 DAO.
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public String test() {
		return session.selectOne("member_id_check");
	}
}
