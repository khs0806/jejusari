package com.kitri.jejusari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	// 메인 리다이렉트
	@RequestMapping(value="/")
	public String home() {
		
		return "redirect:main";
	}
	
	// 메인
	@RequestMapping(value="/main")
	public String main() {
		
		return "main/main";
	}
	
	// 회원가입
	@RequestMapping(value="/member/signup")
	public String signUp() {
		
		return "member/member_signup";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/member/withdraw1")
	public String withdraw() {
		
		return "member/member_withdraw1";
	}
	// 회원 탈퇴
	@RequestMapping(value="/member/withdraw2")
	public String withdrawOk() {
		
		return "member/member_withdraw2";
	}
		
	// 로그인
	@RequestMapping(value="/member/login")
	public String login() {
		
		return "member/member_login";
	}
	
	// 마이페이지
	@RequestMapping(value="/member/mypage")
	public String myPage() {
		
		return "member/member_mypage";
	}
	
	// 회원수정
	@RequestMapping(value="/member/update")
	public String update() {
		
		return "member/member_update";
	}
	
	// 회원 관리
	@RequestMapping(value="/member/admin")
	public String admin() {
		
		return "admin/member_admin";
	}
	
}
