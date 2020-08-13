package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.jejusari.dao.MemberDao;
import com.kitri.jejusari.dto.MemberDto;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	@Override
	public List<String> testDB() {
		// TODO Auto-generated method stub
		return memberDao.testDB();
	}
	
	@Override
	public int memberJoin(MemberDto memberDto) {
		return memberDao.memberJoin(memberDto);
	}
	
	@Override
	public int member_id_check(String member_id) {
		return memberDao.member_id_check(member_id);
	}
	
}
