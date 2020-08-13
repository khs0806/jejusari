package com.kitri.jejusari.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.SalesDao;
import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesDto;

@Service
public class SalesServiceImp implements SalesService {
	
	@Autowired
	SalesDao salesDao;
	
	@Override
	public List<String> testDB() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void salesDetail(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int sales_number=Integer.parseInt(request.getParameter("sales_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		
		SalesDto salesDto=salesDao.salesDetail(sales_number);
		String[] sales_option=salesDto.getSales_option().split(",");
		for(int i=0;i<sales_option.length;i++) {
			if(sales_option[i].equals("풀옵션")) salesDto.setSales_full(1);
			if(sales_option[i].equals("주차장")) salesDto.setSales_parking(1);;
			if(sales_option[i].equals("CCTV")) salesDto.setSales_cctv(1);
			if(sales_option[i].equals("엘리베이터")) salesDto.setSales_ele(1);
		}
		
		String member_id=salesDto.getMember_id();
		MemberDto memberDto=salesDao.salesBroker(member_id); 
		
		int scrap_count=salesDao.salesScrapCount(sales_number);
		
		mav.addObject("scrap_count",scrap_count);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("memberDto",memberDto);
		mav.addObject("salesDto",salesDto);
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
	public void salesScrap(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
		
		//수정필요
		int sales_number=Integer.parseInt(request.getParameter("sales_number"));
		String member_name=(String) session.getAttribute("user");
		System.out.println(sales_number+" , "+member_name);
		map.put("sales_number",sales_number);
		map.put("member_id", member_name);
		
//		int check=0;
//		int scrap_check=salesDao.salesScrapCheck(map);
//		if(scrap_check==0) {
//			check=salesDao.salesScrap(map);
//		}
//		
//		mav.addObject("check",check);
	}

	@Override
	public void salesList(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
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
			salesList=salesDao.salesList(startRow, endRow);
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
	
}
