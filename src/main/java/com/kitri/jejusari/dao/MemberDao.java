package com.kitri.jejusari.dao;

import java.util.List;

import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.NoticeDto;

public interface MemberDao {
	
	// 회원가입
	public int memberJoin(MemberDto memberDto);
	
	// 아이디 중복 체크
	public int member_id_check(String member_id);
	
	// 회원탈퇴
	public int member_delete(String member_id);
	
	// 회원 삭제
	public int dropMember(List<String> list);



	public int memberCount();
	
	// 회원 리스트
	public List<String> memberList(int startRow, int endRow);


	
	// 임시 로그인
	public MemberDto tempLogin(MemberDto memberDto);


	
	// 임시 로그인
	public MemberDto tempLogin(MemberDto memberDto);
>>>>>>> f738c5051f6f319558d95fd6a68b1b37b2ba1d49
}
