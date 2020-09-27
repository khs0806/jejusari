package com.kitri.jejusari.sales.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.member.model.dto.MemberDto;
import com.kitri.jejusari.sales.model.dto.SalesDto;


public interface SalesService {
	
	//상세페이지
	public void salesDetail(Model model, int sales_number, int pageNumber, String session_member_id); 
	
	public MemberDto salesBroker(String member_id);
	
	public int salesScrap(Map<String, Object> map);

	public Map<String, Object> salesList(SalesDto salesDto);

	public int salesWriteOk(SalesDto salesDto, String sageFile);
	
	public HashMap<String, Object> salesUpdate(int sales_number);
	
	public int salesUpdateOk(Map<String, Object> map);
	
	public int salesDeleteOk(int sales_number);
	
	public String salesIdCheck(int sales_number);
	
	public String getAddress(int sales_number);
}
