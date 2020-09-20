package com.kitri.jejusari.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.board.model.dto.NoticeDto;
import com.kitri.jejusari.member.model.dto.MemberDto;

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

	// 마이페이지
	public Map<String, Object> myPage(String member_id);
	
	// 임시 로그인
	public MemberDto tempLogin(MemberDto memberDto);
	
	// 회원수정
	public int memberUpdate(MemberDto memberDto);
}
