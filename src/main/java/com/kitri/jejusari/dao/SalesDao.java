package com.kitri.jejusari.dao;


import java.util.List;
import java.util.Map;

import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesDto;

public interface SalesDao {

	//상세페이지
	public SalesDto salesDetail(int sales_number);
	public MemberDto salesBroker(String member_id);
	public int salesScrapCheck(Map<String, Object> map);
	public int salesScrap(Map<String, Object> map);
	public int salesScrapCount(int sales_number);

	//
	public int salesCount();
	public List<SalesDto> salesList(int startRow, int endRow, SalesDto salesDto);
	public int salesWriteOk(SalesDto salesDto);
	public int salesDelete(SalesDto salesDto);
	public String salesIdCheck(int sales_number);
	public String getAddress(int sales_number);
	
	// 상세매물의 지수5개 가져오기
	public Map<String, Object> getFactor(int sales_number);
	// 상세매물의 지수5개 인서트하기
	public void insertFactor(Map<String,Object> factorMap);
	
}
