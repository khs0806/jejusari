package com.kitri.jejusari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SalesController {

	@RequestMapping(value="/sales")
	public String sales() {
		return "sales/sales_list";
	}
	
	@RequestMapping(value="/sales/write")
	public String saleswrite() {
		
		return "sales/sales_write";
	}
	
	@RequestMapping(value="/sales/writeOk")
	public String saleswriteOk() {
		
		return "sales/sales_write";
	}
	
	@RequestMapping(value="/sales/detail")
	public String salesdetail() {
		
		return "sales/sales_details";
	}
	
}
