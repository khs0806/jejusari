package com.kitri.jejusari.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dto.ReportDto;
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
	
	
	@RequestMapping(value="/sales/delete", method=RequestMethod.GET)
	public ModelAndView salesDelete(HttpServletRequest request, HttpServletResponse response) {

		
		ModelAndView mav=new ModelAndView();
		String sales_number = request.getParameter("sales_number");
		mav.addObject("sales_number", sales_number);
		mav.addObject("request", request);
		
		mav.setViewName("sales/sales_delete");
		
		return mav; 
		
	}
	

	@RequestMapping(value="/sales/delete", method=RequestMethod.POST)
	public ModelAndView salesDeleteOk(HttpServletRequest request, HttpServletResponse response, SalesDto salesDto) {
		
		System.out.println( "salesDto : " + salesDto.toString());			// 넘어오는지 확인
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		int sales_number = Integer.parseInt(request.getParameter("sales_number"));
		System.out.println(sales_number);
		HttpSession session = request.getSession();
		
		String member_id = (String) session.getAttribute("user");
		String db_id = salesService.salesIdCheck(sales_number);
		
		if(member_id.equals(db_id)) {
			salesService.salesDeleteOk(mav);
		} else {
			mav.addObject("check", "0");
		}
		
		mav.setViewName("sales/sales_deleteOk");
		
		return mav;
	}

}
