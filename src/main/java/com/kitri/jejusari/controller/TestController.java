package com.kitri.jejusari.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kitri.jejusari.service.TestService;


@Controller
public class TestController {
	
	// 테스트용 컨트롤러입니다.
	
	@Autowired
	TestService service;
	
	@RequestMapping(value="/test")
	public String test(Model model) {
		String test = null;
		
		test = service.test();
		
		model.addAttribute("test", test);
		System.out.println(test);
		return "test";
	}

}
