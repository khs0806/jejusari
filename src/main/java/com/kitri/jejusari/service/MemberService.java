package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;
import com.kitri.jejusari.dto.MemberDto;

public interface MemberService {
	
	// 회원가입
	public int memberJoin(MemberDto memberDto);
	
	// 아이디 중복체크
	public int member_id_check(String member_id);
	
	// 회원리스트
	public void getMemberList(ModelAndView mav);
	
	// 회원삭제
	public int dropMember(List<String> list);

	// 마이페이지
	public void myPage(ModelAndView mav);
	
	// 스크랩 카드 삭제
	public void deleteScrap(ModelAndView mav);
	
}
