package com.kitri.jejusari.sales.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.sales.model.dto.SalesDto;


public interface SalesService {
	
	//상세페이지
	public void salesDetail(ModelAndView mav); 
	
	public void salesBroker(ModelAndView mav);
	
	public int salesScrap(ModelAndView mav);

	public Map<String, Object> salesList(SalesDto salesDto);

	public int salesWriteOk(SalesDto salesDto, String sageFile);
	
	public void salesUpdate(ModelAndView mav);
	
	public void salesUpdateOk(ModelAndView mav);
	
	public void salesDeleteOk(ModelAndView mav);
	
	public String salesIdCheck(int sales_number);
	
	public String getAddress(int sales_number);
}
