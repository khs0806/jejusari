package com.kitri.jejusari.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.member.model.dao.MemberDao;
import com.kitri.jejusari.member.model.dto.MemberDto;
import com.kitri.jejusari.sales.model.dto.SalesImgDto;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;

	@Override
	public int memberJoin(MemberDto memberDto) {
		return memberDao.memberJoin(memberDto);
	}

	@Override
	public int member_id_check(String member_id) {
		return memberDao.member_id_check(member_id);
	}

	@Override
	public int member_delete(String member_id) {

		return memberDao.member_delete(member_id);
	}

	@Override
	public void getMemberList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		// 페이징
		String pageNumber = request.getParameter("pageNumber");
		System.out.println("pageNumber" + pageNumber);
		if (pageNumber == null)
			pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber); // 요청한 페이지
		int boardSize = 10; // [1] start:1, end:10 [2] start:11, end:20

		int startRow = (currentPage - 1) * boardSize + 1; // 1 11 21 31
		int endRow = currentPage * boardSize; // 10 20 30 40

		// count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count = memberDao.memberCount();
		List<String> memberList = null;

		if (count > 0) {
			// startRow, endRow
			memberList = memberDao.memberList(startRow, endRow);
		}

		mav.addObject("MemberList", memberList);
		System.out.println(memberList);

		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);

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
		return memberDao.tempLogin(memberDto);
	}

	@Override
	public int memberUpdate(MemberDto memberDto) {
		return memberDao.memberUpdate(memberDto);
	}

}
