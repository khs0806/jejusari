package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.jejusari.dao.MemberDao;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	MemberDao memberDao;
	
	@Override
	public List<String> testDB() {
		return memberDao.testDB();
	}
}
