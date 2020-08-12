package com.kitri.jejusari.dao;

import java.util.List;

import com.kitri.jejusari.dto.SalesDto;

public interface SalesDao {

	//상세페이지
	public String salesDetail(String id);

	public int salesCount();

	public List<SalesDto> salesList(int startRow, int endRow);
}
