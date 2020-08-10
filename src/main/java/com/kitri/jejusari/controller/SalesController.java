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
	public String login() {
		
		return "sales/sales_write";
	}
	
	@RequestMapping(value="/news")
	public String news() {
		
		return "news/news_list";
	}
	
	@RequestMapping(value="/notice")
	public String notice() {
		
		return "notice/notice_list";
	}
	
	@RequestMapping(value="/report")
	public String report() {
		
		return "report/report_list";
	}
	
}
