package com.kitri.jejusari.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.SalesDto;

@Repository
public class SalesDaoImp implements SalesDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public SalesDto salesDetail(int sales_number) {
		
		return session.selectOne("sales_detail_select",sales_number);
	}
	
}
