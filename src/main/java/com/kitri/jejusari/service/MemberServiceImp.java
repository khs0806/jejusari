package com.kitri.jejusari.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.MemberDao;
import com.kitri.jejusari.dto.SalesDto;

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
	
	/*
	 * @Override public void deleteScrap(ModelAndView mav) { Map<String, Object>
	 * map=mav.getModelMap(); HttpServletRequest request=(HttpServletRequest)
	 * map.get("request");
	 * 
	 * memberDao.deleteScrap }
	 */
	
}
