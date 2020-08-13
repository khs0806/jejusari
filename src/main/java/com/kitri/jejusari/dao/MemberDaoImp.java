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
	public List<String> testDB() {
		return session.selectList("member_id_check");
	}
	
	@Override
	public int memberJoin(MemberDto memberDto) {
		return session.insert("member_join", memberDto);
	}
	
	@Override
	public int member_id_check(String member_id) {
		// TODO Auto-generated method stub
		return session.selectOne("member_id_check",member_id);
	}
	
}
