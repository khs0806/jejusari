package com.kitri.jejusari.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.MemberDao;
import com.kitri.jejusari.dto.MemberDto;

@Service
public class MemberServiceImp implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	@Override
	public int memberJoin(MemberDto memberDto) {
		return memberDao.memberJoin(memberDto);
	}
	
	@Override
	public int member_id_check(String member_id) {
		return memberDao.member_id_check(member_id);
	}
	
	@Override
	public int member_delete(String member_id) {
		
		return memberDao.member_delete(member_id);
	}
	
	@Override
	public void getMemberList(ModelAndView mav) {
		List<String> memberList = memberDao.memberList();

		mav.addObject("MemberList", memberList);
		//System.out.println(memberList);
		
		mav.setViewName("/admin/member_admin.tiles");
	}

	@Override
	public int dropMember(List<String> list) {
	    	     
	    return memberDao.dropMember(list);
		
	}
	
}
