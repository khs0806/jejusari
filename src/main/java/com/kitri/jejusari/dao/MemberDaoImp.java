package com.kitri.jejusari.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.MemberDto;

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
		return session.selectOne("member_id_check",member_id);
	}
	
	@Override
	public int member_delete(String member_id) {
		// TODO Auto-generated method stub
		return session.delete("member_delete", member_id);
	}
	
	@Override
	public List<String> memberList() {
		return session.selectList("memberList");
	}
	
	@Override
	public List<String> getScrapImg(String member_id) {
//		System.out.println(session.selectList("getScrapSalesNumber", member_id));
		return session.selectList("getImg", session.selectList("getScrapSalesNumber", member_id));
	}
	
	@Override
	public List<String> getSalesImg(String member_id) {
		return session.selectList("getImg", session.selectList("getSalesSalesNumber", member_id));
	}

	@Override
	public int dropMember(List<String> list) {
		return session.delete("dropMember", list);
	}
	
	@Override
	public MemberDto tempLogin(MemberDto memberDto) {
		MemberDto member = session.selectOne("member_login", memberDto);
		return member;
	}
	
}
