package com.kitri.jejusari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SalesController {

	@RequestMapping(value="/sales")
	public String sales(HttpServletRequest request, HttpServletResponse response) {
		return "sales/sales_list";
	}
	
	@RequestMapping(value="/sales/write")
	public String saleswrite(HttpServletRequest request, HttpServletResponse response) {
		
		return "sales/sales_write";
	}
	
	@RequestMapping(value="/sales/writeOk")
	public String saleswriteOk(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView();
		mav.addObject(request);
		
		return "sales/sales_write";
	}
	
	@RequestMapping(value="/sales/detail")
	public String salesdetail(HttpServletRequest request, HttpServletResponse response) {
		
		return "sales/sales_details";
	}
	
}
