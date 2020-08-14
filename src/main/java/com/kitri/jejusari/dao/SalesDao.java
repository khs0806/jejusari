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
	public List<SalesDto> salesList(int startRow, int endRow);
	public int salesWriteOk(SalesDto salesDto);
	public int salesDelete1(SalesDto salesDto);
	public int salesDelete2(SalesDto salesDto);
	public int salesDelete3(SalesDto salesDto);
	public int salesDelete4(SalesDto salesDto);
	public int salesDelete5(SalesDto salesDto);
	public String salesIdCheck(int sales_number);
}
