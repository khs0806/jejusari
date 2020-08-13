package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dto.SalesDto;

public interface SalesService {
	
	// DB테스트
	public List<String> testDB();
	
	//상세페이지
	public void salesDetail(ModelAndView mav); 
	public void salesBroker(ModelAndView mav);
	public void salesScrap(ModelAndView mav);

	//
	public void salesList(ModelAndView mav);

	public void salesWriteOk(ModelAndView mav);

	
}
