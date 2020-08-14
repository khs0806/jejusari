package com.kitri.jejusari.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.common.KakaoLocalAPI;
import com.kitri.jejusari.dao.SalesDao;
import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesDto;

@Service
public class SalesServiceImp implements SalesService {
	
	@Autowired
	SalesDao salesDao;
	
	@Override
	public void salesDetail(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int sales_number=Integer.parseInt(request.getParameter("sales_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		HttpSession session=request.getSession();
//====================================================================================
		// by.gustn
		// 더미 매물DB를 이용하여 지수테이블에 인서트하는 코드 <필독>
		// 매물게시물 읽을 때 지수 테이블에 해당 게시물의 지수5개가 입력되게 한다.
		// 이런식으로 더미 매물DB의 지수를 전부 지수테이블에 인서트한다.
		
//		String address = getAddress(sales_number);
//		System.out.println("address : " + address);
//		List<String> factors = KakaoLocalAPI.kakaoAPI(address);
//		System.out.println(factors.toString());
//		Map<String, Object> factorMap = new HashMap<String, Object>();
//		factorMap.put("factor_gas", factors.get(0));
//		factorMap.put("factor_mart", factors.get(1));
//		factorMap.put("factor_public", factors.get(2));
//		factorMap.put("factor_hospital", factors.get(3));
//		factorMap.put("factor_tour", factors.get(4));
//		int sum = 0;
//		for(int i=0; i<factors.size(); i++) {
//			sum += Integer.parseInt(factors.get(i));
//		}
//		factorMap.put("factor_total", sum);
//		factorMap.put("sales_number", sales_number);
//		System.out.println(factorMap.toString());
//		salesDao.insertFactor(factorMap);
//===================================================================================
		
		String session_member_id=(String) session.getAttribute("member_id");
		mav.addObject("session_member_id",session_member_id);
		System.out.println(session_member_id);
		
		SalesDto salesDto=salesDao.salesDetail(sales_number);
		String[] sales_option=salesDto.getSales_option().split(",");
		for(int i=0;i<sales_option.length;i++) {
			if(sales_option[i].equals("풀옵션")) salesDto.setSales_full(1);
			if(sales_option[i].equals("주차장")) salesDto.setSales_parking(1);;
			if(sales_option[i].equals("CCTV")) salesDto.setSales_cctv(1);
			if(sales_option[i].equals("엘리베이터")) salesDto.setSales_ele(1);
		}
		
		if(session_member_id!=null) {
			map.put("member_id",session_member_id);
			map.put("sales_number",salesDto.getSales_number());
			int scrap_check=salesDao.salesScrapCheck(map);
			mav.addObject("scrap_check",scrap_check);
		}
		
		String member_id=salesDto.getMember_id();
		MemberDto memberDto=salesDao.salesBroker(member_id); 
		
		int scrap_count=salesDao.salesScrapCount(sales_number);
		
		// by.gustn
		// 해당 매물의 지수 정보 가져오기
		Map<String, Object> factorMap = salesDao.getFactor(sales_number);
		System.out.println(factorMap.toString());
		
		mav.addObject("scrap_count",scrap_count);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("memberDto",memberDto);
		mav.addObject("salesDto",salesDto);
		mav.addObject("factorMap",factorMap);
		mav.setViewName("sales/sales_details.tiles");
	}
	
	@Override
	public void salesBroker(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String member_id=request.getParameter("member_id");
		
		MemberDto memberDto=salesDao.salesBroker(member_id); 
		
		mav.addObject("memberDto",memberDto);
		mav.setViewName("sales/sales_broker.empty");
	}
	
	@Override
	public int salesScrap(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
		
		int sales_number=Integer.parseInt(request.getParameter("sales_number"));
		String member_id=(String) session.getAttribute("member_id");
		System.out.println(sales_number+" , "+member_id);
		map.put("sales_number",sales_number);
		map.put("member_id", member_id);
		
		int check=0;
		int scrap_check=salesDao.salesScrapCheck(map);
		if(scrap_check==0) {
			check=salesDao.salesScrap(map);
		}
		
		return check;
	}

	@Override
	public void salesList(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		SalesDto salesDto=(SalesDto)map.get("salesDto");
		
		//페이징
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		int currentPage=Integer.parseInt(pageNumber);	//요청한 페이지
		int boardSize=10;		// [1] start:1, end:10  [2] start:11, end:20
		
		int startRow=(currentPage-1)*boardSize+1;	//1  11 21 31
		int endRow=currentPage*boardSize;			//10 20 30 40
		
		//count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count=salesDao.salesCount();
		List<SalesDto> salesList=null;
		
		if(count>0) {
			//startRow, endRow
			salesList=salesDao.salesList(startRow, endRow, salesDto);
			//System.out.println("saleslist : " + salesList.toString());
		}
		
		
		mav.addObject("salesList", salesList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.setViewName("sales/sales_list.tiles");
	}

	@Override
	public void salesWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		SalesDto salesDto=(SalesDto)map.get("salesDto");
		
		int check = salesDao.salesWriteOk(salesDto);
		
	}
	
	
	@Override
	public void salesDeleteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		System.out.println(request.getParameter("sales_number"));
		int sales_number = Integer.parseInt(request.getParameter("sales_number"));
		SalesDto salesDto = new SalesDto();
		salesDto.setSales_number(sales_number);
		
		int check = salesDao.salesDelete(salesDto);
		System.out.println("check : " + check);
		
		
		mav.addObject("check", check);
		
	}
	
	@Override
	public String salesIdCheck(int sales_number) {
		return salesDao.salesIdCheck(sales_number);
	}
	
	@Override
	public String getAddress(int sales_number) {
		return salesDao.getAddress(sales_number);
	}
	
}
