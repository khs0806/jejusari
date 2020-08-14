package com.kitri.jejusari.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dto.MemberDto;

public interface MemberService {
	
	// 회원가입
	public int memberJoin(MemberDto memberDto);
	// 아이디 중복체크
	public int member_id_check(String member_id);
	// 회원탈퇴
	public int member_delete(String member_id);
	// 회원리스트
	public void getMemberList(ModelAndView mav);
	// 회원삭제
	public int dropMember(List<String> list);
	// 임시 로그인
	public MemberDto tempLogin(MemberDto memberDto);
	// 회원수정
	public int memberUpdate(MemberDto memberDto);
}
