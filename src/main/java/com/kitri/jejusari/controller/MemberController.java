package com.kitri.jejusari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping(value="/")
	public String main() {
		return "main/main";
	}
	
	@RequestMapping(value="/login")
	public String login() {
		
		return "member/member_login";
	}
	
	@RequestMapping(value="/mypage")
	public String myPage() {
		
		return "member/member_mypage";
	}
	
	@RequestMapping(value="/signup")
	public String signUp() {
		
		return "member/member_signup";
	}
	
	@RequestMapping(value="/update")
	public String update() {
		
		return "member/member_update";
	}
	
	@RequestMapping(value="/withdraw")
	public String withdraw() {
		
		return "member/member_withdraw";
	}
	
}
