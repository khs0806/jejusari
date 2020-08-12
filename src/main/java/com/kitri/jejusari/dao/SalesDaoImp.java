package com.kitri.jejusari.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDaoImp implements SalesDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public String salesDetail(String id) {
		
		return session.selectOne("selectttt",id);
	}
	
}
