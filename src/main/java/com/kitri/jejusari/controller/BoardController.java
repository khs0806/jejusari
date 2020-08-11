package com.kitri.jejusari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	
	// 사이트소개
	@RequestMapping(value="/introduce")
	public String introduce() {
		return "main/introduce";
	}
	
	// 뉴스리스트
	@RequestMapping(value="/news")
	public String news() {
		
		return "news/news_list";
	}
	
	// 공지사항 목록
	@RequestMapping(value="/notice")
	public String notice() {
		
		return "notice/notice_list";
	}
	
	// 공지사항 상세보기
	@RequestMapping(value="/notice/detail")
	public String noticeDetail() {
		
		return "notice/notice_read";
	}
	
	// 공지사항 작성 화면
	@RequestMapping(value="/notice/write")
	public String noticeWrite() {
		
		return "notice/notice_write";
	}
	
	// 공지사항 작성
	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
	public String noticeWriteDo() {
		
		return "notice/notice_writeOk";
	}
	
	// 공지사항 수정 화면
	@RequestMapping(value="/notice/update")
	public String noticeUpdate() {
		
		return "notice/notice_update";
	}
	
	// 공지사항 수정
	@RequestMapping(value="/notice/update", method=RequestMethod.POST)
	public String noticeUpdateDo() {
		
		return "notice/notice_updateOk";
	}
	
	// 공지사항 삭제화면
	@RequestMapping(value="/notice/delete")
	public String noticeDelete() {
		
		return "notice/notice_delete";
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/notice/delete", method=RequestMethod.POST)
	public String noticeDeleteDo() {
		
		return "notice/notice_deleteOk";
	}
	
	// 신고 작성
	@RequestMapping(value="/report/write")
	public String report() {
		
		return "report/report_write";
	}
	
	// 신고 관리자
	@RequestMapping(value="/report/admin")
	public String reportAdmin() {
		
		return "admin/report_admin";
	}
}
