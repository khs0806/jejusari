package com.kitri.jejusari.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.member.model.dao.MemberDao;
import com.kitri.jejusari.member.model.dto.MemberDto;
import com.kitri.jejusari.sales.model.dto.SalesImgDto;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@Override
	public int memberJoin(MemberDto memberDto) {
		return memberDao.memberJoin(memberDto);
	}

	@Override
	public int member_id_check(String member_id) {
		return memberDao.member_id_check(member_id);
	}

	@Override
	public int member_kakao_id_check(String member_kakao_id) {
		return memberDao.member_kakao_id_check(member_kakao_id);
	}

	@Override
	public int member_delete(String member_id) {

		return memberDao.member_delete(member_id);
	}

	@Override
	public List<String> getMemberList(int pageNumber, Model model) {

		// 페이징
		System.out.println("pageNumber" + pageNumber);
		if (pageNumber == 0)
			pageNumber = 1;
		int currentPage = pageNumber; // 요청한 페이지
		int boardSize = 10; // [1] start:1, end:10 [2] start:11, end:20

		int startRow = (currentPage - 1) * boardSize + 1; // 1 11 21 31
		int endRow = currentPage * boardSize; // 10 20 30 40

		// count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count = memberDao.memberCount();
		List<String> memberList = null;

		if (count > 0) {
			// startRow, endRow
			memberList = memberDao.memberList(startRow, endRow);
			System.out.println(memberList);
		}
		
		model.addAttribute("boardSize", boardSize);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("count", count);
		
		return memberList;
	}

	@Override
	public int dropMember(List<String> list) {

		return memberDao.dropMember(list);
	}

	@Override
	public Map<String, Object> myPage(String member_id) {
		Map<String, Object> myInfo = new HashMap<>();

		List<SalesImgDto> scrapList = memberDao.getScrap(member_id);
		myInfo.put("scrapList", scrapList);

		List<SalesImgDto> salesList = memberDao.getSales(member_id);
		myInfo.put("salesList", salesList);

		return myInfo;
	}

	@Override
	public MemberDto tempLogin(MemberDto memberDto) {
		
		MemberDto member = memberDao.tempLogin(memberDto);
		if (member != null) {
			if (pwdEncoder.matches(memberDto.getMember_pwd(), member.getMember_pwd())) {
				return member;
			}
		}
				
		return null;
	}

	@Override
	public MemberDto kakaoLogin(MemberDto memberDto) {
		return memberDao.kakaoLogin(memberDto);
	}

	@Override
	public int memberUpdate(MemberDto memberDto) {
		return memberDao.memberUpdate(memberDto);
	}

}
