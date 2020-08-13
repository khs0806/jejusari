package com.kitri.jejusari.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesDto;

@Repository
public class SalesDaoImp implements SalesDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	//상세페이지
	@Override
	public SalesDto salesDetail(int sales_number) {
		return session.selectOne("sales_detail_select",sales_number);
	}
	@Override
	public MemberDto salesBroker(String member_id) {
		return session.selectOne("sales_broker_select",member_id);
	}

	@Override
	public int salesScrapCheck(Map<String, Object> map) {
		return session.selectOne("sales_scrap_check",map);
	}
	
	@Override
	public int salesScrap(Map<String, Object> map) {
		return session.insert("sales_scrap", map);
	}
	
	@Override
	public int salesScrapCount(int sales_number) {
		return session.selectOne("sales_scrap_count",sales_number);
	}

	//
	@Override
	public int salesCount() {
		return session.selectOne("sales_getCount");
	}

	@Override
	public List<SalesDto> salesList(int startRow, int endRow) {
		Map<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		
		return session.selectList("sales_list", hmap);
	}
	
	@Override
	public int salesWriteOk(SalesDto salesDto) {
		
		return session.insert("sales_write", salesDto);
	}
	
}
