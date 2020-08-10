package com.kitri.jejusari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesController {

	@RequestMapping(value="/saleslist")
	public String sales() {
		return "sales/sales_list";
	}
	
	@RequestMapping(value="/saleswrite")
	public String saleswrite() {
		
		return "sales/sales_write";
	}
	
	@RequestMapping(value="/salesdetail")
	public String salesdetail() {
		
		return "sales/sales_details";
	}
	
	@RequestMapping(value="/news")
	public String news() {
		
		return "news/news_list";
	}
	
	@RequestMapping(value="/notice")
	public String notice() {
		
		return "notice/notice_list";
	}
	
	@RequestMapping(value="/reportwrite")
	public String report() {
		
		return "report/report_write";
	}
	
	@RequestMapping(value="/reportadmin")
	public String reportAdmin() {
		
		return "admin/report_admin";
	}
	
}
