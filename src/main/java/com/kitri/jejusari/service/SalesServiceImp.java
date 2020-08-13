package com.kitri.jejusari.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.SalesDao;
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
		
		SalesDto salesDto=salesDao.salesDetail(sales_number);
		System.out.println(salesDto);
		
		mav.addObject("salesDto",salesDto);
		mav.setViewName("sales/sales_details.tiles");
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
	
}
