package com.kitri.jejusari.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.MemberDao;
import com.kitri.jejusari.dto.MemberDto;

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
	
	@Override
	public void myPage(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
		
		String member_id=(String) session.getAttribute("member_id");
		
		List<String> scrapImgList=memberDao.getScrapImg(member_id);
		System.out.println(scrapImgList);
		
		List<String> salesImgList=memberDao.getSalesImg(member_id);
		System.out.println(salesImgList);
		
		mav.addObject("scrapImgList", scrapImgList);
		mav.addObject("salesImgList", salesImgList);
		mav.setViewName("member/member_mypage.tiles");
	}
	
	
	  @Override
	  public void deleteScrap(ModelAndView mav) {
		  Map<String, Object> map=mav.getModelMap();
		  HttpServletRequest request=(HttpServletRequest) map.get("request");
		  HttpSession session=request.getSession();
		  
		  String member_id=(String) session.getAttribute("member_id");
		  String sales_number=(String) request.getAttribute("sales_number");
		  
		  memberDao.deleteScrap(member_id, sales_number);
	  
	  }
	 
}
