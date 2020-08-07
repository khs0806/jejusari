package com.kitri.jejusari.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.jejusari.dao.TestDao;


@Service
public class TestServiceImp implements TestService{
	
	// 테스트용 Service
	
	@Autowired
	TestDao dao;
	
	@Override
	public String test() {
		return dao.test();
	}
}
