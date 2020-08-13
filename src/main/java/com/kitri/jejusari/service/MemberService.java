package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	
	// DB테스트
	public List<String> testDB();

	public void myPage(ModelAndView mav);

//	public void deleteScrap(ModelAndView mav);
	
}
