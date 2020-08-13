package com.kitri.jejusari.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.ReportDto;

@Repository
public class BoardDaoImp implements BoardDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int reportInsert(ReportDto reportDto) {
		// TODO Auto-generated method stub
		return session.insert("report_insert", reportDto);
	}
}
