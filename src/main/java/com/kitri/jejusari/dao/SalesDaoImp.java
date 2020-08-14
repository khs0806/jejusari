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
	public int salesScrapDo(Map<String, Object> map) {
		return session.insert("sales_scrap_do", map);
	}
	
	@Override
	public int salesScrapDelete(Map<String, Object> map) {
		return session.delete("sales_scrap_delete",map);
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
	public List<SalesDto> salesList(int startRow, int endRow, SalesDto salesDto) {
		Map<String, Object> hmap=new HashMap<String, Object>();
		
		// sales_category_type 의 String Type을 배열로 바꿔주는 작업
		String[] sales_category_type_list=null;
		if(salesDto.getSales_category_type()!=null) {
			 sales_category_type_list = salesDto.getSales_category_type().split(",");
//			 System.out.println(sales_category_type_list.length);
//			 for(int i=0; i<sales_category_type_list.length; i++) {
//				 System.out.println(sales_category_type_list[i]);
//			 }
		}
		
		System.out.println("salesDto.getSales_category_rent() : "+salesDto.getSales_category_rent());
		
		
		
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		hmap.put("sales_category_rent", salesDto.getSales_category_rent());
		hmap.put("sales_category_type_list", sales_category_type_list);
		return session.selectList("sales_list", hmap);
	}
	
	@Override
	public int salesWriteOk(SalesDto salesDto) {
		
		return session.insert("sales_write", salesDto);
	}
	
	@Override
	public int salesDelete1(SalesDto salesDto) {
		// TODO Auto-generated method stub
		return session.delete("sales_delete1", salesDto);
	}
	
	@Override
	public int salesDelete2(SalesDto salesDto) {
		// TODO Auto-generated method stub
		return session.delete("sales_delete2", salesDto);
	}
	@Override
	public int salesDelete3(SalesDto salesDto) {
		// TODO Auto-generated method stub
		return session.delete("sales_delete3", salesDto);
	}
	
	@Override
	public int salesDelete4(SalesDto salesDto) {
		// TODO Auto-generated method stub
		return session.delete("sales_delete4", salesDto);
	}
	
	@Override
	public int salesDelete5(SalesDto salesDto) {
		// TODO Auto-generated method stub
		return session.delete("sales_delete5", salesDto);
	}
	
	
	@Override
	public String salesIdCheck(int sales_number) {
		return session.selectOne("get_member_id", sales_number);
	}
	
	@Override
	public String getAddress(int sales_number) {
		return session.selectOne("get_address", sales_number);
	}
	
	//
	@Override
	public void insertFactor(Map<String, Object> factorMap) {
		session.insert("insert_factor", factorMap);
	}
	
	@Override
	public Map<String, Object> getFactor(int sales_number) {
		return session.selectOne("get_factor", sales_number);
	}
	
	@Override
	public int updateSalesDB(Map<String, Object> factorMap_update) {
		return session.update("db_sales_update",factorMap_update);
	}
	
	@Override
	public int totalAll() {
		return session.selectOne("factor_total_all");
	}
	
	@Override
	public int getSalesNumber(String member_id) {
		return session.selectOne("get_sales_number", member_id);
	}
	
}
