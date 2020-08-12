package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

public interface SalesService {
	
	// DB테스트
	public List<String> testDB();
	
	//상세페이지
	public String salesDetail(ModelAndView mav);

	public void salesList(ModelAndView mav);
	
}
