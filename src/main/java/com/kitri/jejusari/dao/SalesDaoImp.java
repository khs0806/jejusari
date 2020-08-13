package com.kitri.jejusari.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.SalesDto;

@Repository
public class SalesDaoImp implements SalesDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public SalesDto salesDetail(int sales_number) {
		
		return session.selectOne("sales_detail_select",sales_number);
	}

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
