package com.kitri.jejusari.dao;

import java.util.List;

import com.kitri.jejusari.dto.SalesDto;

public interface MemberDao {
	
	// DB 테스트
	public List<String> testDB();

	public List<String> getScrapImg(String member_id);

	public List<String> getSalesImg(String member_id);

}
