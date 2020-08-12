package com.kitri.jejusari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dto.SalesDto;
import com.kitri.jejusari.service.SalesService;

@Controller
public class SalesController {
	
	@Autowired
	SalesService salesService;
	
	@RequestMapping(value="/sales")
	public String sales(HttpServletRequest request, HttpServletResponse response) {
		return "sales/sales_list.tiles";
	}
	
	@RequestMapping(value="/sales/write")
	public String saleswrite(HttpServletRequest request, HttpServletResponse response) {
		
		return "sales/sales_write.tiles";
	}
	
	@RequestMapping(value="/sales/writeOk")
	public String saleswriteOk(HttpServletRequest request, HttpServletResponse response, SalesDto salesDto) {
		
		ModelAndView mav= new ModelAndView();
		mav.addObject(request);
		System.out.println(salesDto);
		
		return "sales/sales_write.tiles";
	}
	
	@RequestMapping(value="/sales/detail")
	public String salesDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		salesService.salesDetail(mav);
		
		return "sales/sales_details.tiles";
	}
	
	@RequestMapping(value="/sales/broker")
	public String salesdroker(HttpServletRequest request, HttpServletResponse response) {
		
		return "sales/sales_broker.empty";
	}
	
	@RequestMapping(value="/sales/test")
	public ModelAndView salesTest(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelAndView mav = new ModelAndView();
		String id = "khs";
		mav.addObject("id", id);
		salesService.salesDetail(mav);
		
		return null;
	}
	
}
