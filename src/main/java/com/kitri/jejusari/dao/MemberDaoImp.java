package com.kitri.jejusari.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.NoticeDto;

@Repository
public class MemberDaoImp implements MemberDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int memberJoin(MemberDto memberDto) {
		return session.insert("member_join", memberDto);
	}
	
	@Override
	public int member_id_check(String member_id) {
		// TODO Auto-generated method stub
		return session.selectOne("member_id_check",member_id);
	}
	
	@Override
	public int member_delete(String member_id) {
		// TODO Auto-generated method stub
		return session.delete("member_delete", member_id);
	}
	
	/*
	 * @Override public List<String> memberList() {
	 * 
	 * return session.selectList("memberList"); }
	 */
	

	@Override
	public int dropMember(List<String> list) {

		return session.delete("dropMember", list);
	}

	@Override
	public int memberCount() {
		return session.selectOne("memberadmin_count");
	}

	@Override
	public List<String> memberList(int startRow, int endRow) {
		Map<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		
		return session.selectList("memberadmin_list", hmap);
	}
	
	@Override
	public MemberDto tempLogin(MemberDto memberDto) {
		MemberDto member = session.selectOne("member_login", memberDto);
		return member;
	}
	
}
