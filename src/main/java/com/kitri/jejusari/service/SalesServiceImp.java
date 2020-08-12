package com.kitri.jejusari.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.SalesDao;
import com.kitri.jejusari.dao.SalesDaoImp;

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
	public String salesDetail(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		String id ="1";
		
		String tit=salesDao.salesDetail(id);
		System.out.println(tit);
		
		return tit;
	}
	
}
