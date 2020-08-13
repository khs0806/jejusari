package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {
	
	
	public void reportWriteOk(ModelAndView mav);
	
	// DB테스트
	public List<String> testDB();
	
}
