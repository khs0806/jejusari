package com.kitri.jejusari.dao;

import com.kitri.jejusari.dto.SalesDto;

public interface SalesDao {

	//상세페이지
	public SalesDto salesDetail(int sales_number);
}
