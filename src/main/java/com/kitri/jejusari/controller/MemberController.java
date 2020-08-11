package com.kitri.jejusari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
	// 로그인 뷰
	@RequestMapping(value="/member/login")
	public String login(HttpSession session) {
		
		return "member/member_login";
	}
	
	// 로그인
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public String loginOk(HttpServletRequest request, HttpSession session) {
		
		// 임시코드, 세션을 부여해주고 메인으로 리다이렉트
		String name = request.getParameter("nickname");
		System.out.println(name);
		session.setAttribute("user", name);
		
		return "redirect:/";
	}
	// 로그아웃
	@RequestMapping(value="/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
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
