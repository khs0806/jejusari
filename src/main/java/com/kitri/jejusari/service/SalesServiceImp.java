package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.jejusari.dao.MemberDao;
import com.kitri.jejusari.dao.SalesDao;

@Service
public class SalesServiceImp implements MemberService{
	
	@Autowired
	SalesDao salesDao;
	
	@Override
	public List<String> testDB() {
		return null;
	}
}
