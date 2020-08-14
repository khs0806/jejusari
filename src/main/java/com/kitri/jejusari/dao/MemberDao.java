package com.kitri.jejusari.dao;

import java.util.List;

import com.kitri.jejusari.dto.MemberDto;

public interface MemberDao {
	
	// 회원가입
	public int memberJoin(MemberDto memberDto);
	
	// 아이디 중복 체크
	public int member_id_check(String member_id);
	
	// 회원탈퇴
	public int member_delete(String member_id);
	
	// 회원 리스트
	public List<String> memberList();
	
	// 회원 삭제
	public int dropMember(List<String> list);

	// 스크랩 이미지
	public List<String> getScrapImg(String member_id);
	
	// 매물 이미지
	public List<String> getSalesImg(String member_id);
	
	// 임시 로그인
	public MemberDto tempLogin(MemberDto memberDto);
}
