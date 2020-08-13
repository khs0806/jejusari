package com.kitri.jejusari.service;

import java.util.HashMap;
import java.util.List;

import com.kitri.jejusari.dto.MemberDto;

public interface MemberService {
	
	// 회원가입
	public int memberJoin(MemberDto memberDto);
	// 아이디 중복체크
	public int member_id_check(String member_id);
	
}
