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
	
}
