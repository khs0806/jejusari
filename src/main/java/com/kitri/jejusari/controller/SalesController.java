package com.kitri.jejusari.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dto.SalesDto;
import com.kitri.jejusari.service.SalesService;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService salesService;
	
	@RequestMapping(value="/sales")
	public ModelAndView salesList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		salesService.salesList(mav);
		return mav;
	}
	
	@RequestMapping(value="/sales/write")
	public String salesWrite(HttpServletRequest request, HttpServletResponse response) {
		
		return "sales/sales_write.tiles";
	}
	
	@RequestMapping(value="/sales/writeOk")
	public String salesWriteOk(HttpServletRequest request, HttpServletResponse response, SalesDto salesDto) {
		
		ModelAndView mav= new ModelAndView();
		mav.addObject(request);
		
		//session으로 아이디 가져오고 나선 없어질 코드
		salesDto.setMember_id("kke");
		//System.out.println(salesDto);
		
		mav.addObject("salesDto", salesDto);
		salesService.salesWriteOk(mav);
		return "sales/sales_write.tiles";
	}
	
	@RequestMapping(value="/sales/detail")
	public ModelAndView salesDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);

		salesService.salesDetail(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/sales/broker")
	public ModelAndView salesBroker(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);

		salesService.salesBroker(mav);
		return mav;
	}
	
	@RequestMapping(value="/sales/scrap")
	public void salesScrap(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);

		int check=salesService.salesScrap(mav);
		PrintWriter out=response.getWriter();
		out.print(check);
	}

}
