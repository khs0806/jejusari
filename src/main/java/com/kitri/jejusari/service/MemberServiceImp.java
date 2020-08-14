package com.kitri.jejusari.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.MemberDao;
import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesDto;
import com.kitri.jejusari.dto.SalesImgDto;

@Service
public class MemberServiceImp implements MemberService {

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
		
		mav.setViewName("admin/member_admin.tiles");
	}

	@Override
	public int dropMember(List<String> list) {
	    return memberDao.dropMember(list);
	}
	
	@Override
	public void myPage(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session =(HttpSession) map.get("session");
		
		String member_id=(String) session.getAttribute("member_id");
		System.out.println("서비스-아이디 : " + member_id);
		
		List<SalesImgDto> scrapList=memberDao.getScrap(member_id);
		System.out.println("서비스-스크랩리스트 : " + scrapList);
		
		List<SalesImgDto> salesList=memberDao.getSales(member_id);
		System.out.println("서비스-세일즈리스트 : " + salesList);
		
//		SalesDto salesDto=memberDao.
		
		mav.addObject("scrapList", scrapList);
		mav.addObject("salesList", salesList);
		mav.setViewName("member/member_mypage.tiles");
	}
	
	@Override
	public MemberDto tempLogin(MemberDto memberDto) {
		return memberDao.tempLogin(memberDto);
	}
	
	@Override
	public void deleteScrap(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
  
  
	}
	 
}
