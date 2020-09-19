package com.kitri.jejusari.board.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.kitri.jejusari.board.model.dto.NoticeDto;
import com.kitri.jejusari.board.model.dto.ReportDto;
import com.kitri.jejusari.board.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	// 메인 리다이렉트
	@GetMapping("/")
	public String home() {
		return "redirect:main";
	}

	// 메인
	@GetMapping("/main")
	public String main(HttpServletRequest request, Model model) {

		List<NoticeDto> noticeList = boardService.noticeList(model);
		List<Map<String, Object>> newsList = boardService.newsList();

		model.addAttribute("newsList", newsList);
		model.addAttribute("noticeList", noticeList);

		return "main/main.tiles";
	}

	// 사이트 소개
	@GetMapping("/introduce")
	public String introduce() {

		return "main/introduce.tiles";
	}

	// 뉴스 리스트
	@GetMapping("/news")
	public String news(Model model) {

		List<Map<String, Object>> newsList = boardService.newsList();

		model.addAttribute("newsList", newsList);

		return "news/news_list.tiles";
	}

	// 공지사항 목록
	@GetMapping("/notice")
	public String noticeList(Model model) {
		
		List<NoticeDto> noticeList = boardService.noticeList(model);
		System.out.println(noticeList);

		model.addAttribute("noticeList", noticeList);

		return "notice/notice_list.tiles";
	}

	// 공지사항 상세보기
	@GetMapping("/notice/detail")
	public String noticeDetail(int notice_number, Model model) {

		NoticeDto noticeDto = boardService.noticeDetail(notice_number);

		model.addAttribute("noticeDto", noticeDto);

		return "notice/notice_read.tiles";
	}

	// 공지사항 작성 화면
	@GetMapping("/notice/write")
	public String noticeWrite() {

		return "notice/notice_write.tiles";
	}

	// 공지사항 작성
	@PostMapping("/notice/writeOk")
	public String noticeWriteDo(NoticeDto noticeDto, Model model) {

		System.out.println("controller : " + noticeDto);
		int check = boardService.noticeWriteOk(noticeDto);

		model.addAttribute("check", check);

		return "notice/notice_writeOk.tiles";
	}

	// 공지사항 수정 화면
	@GetMapping("/notice/update")
	public String noticeUpdate(@RequestParam("notice_number") int noticeNumber, Model model) {

		NoticeDto noticeDto = boardService.noticeUpdate(noticeNumber);
		model.addAttribute("noticeDto", noticeDto);

		return "notice/notice_update.tiles";
	}

	// 공지사항 수정
	@PostMapping(value="/notice/updateOk")
	public String noticeUpdateDo(NoticeDto noticeDto, Model model) {

		int check = boardService.noticeUpdateOk(noticeDto);
		model.addAttribute("check", check);

		return "notice/notice_updateOk.tiles";
	}

	// 공지사항 삭제화면
	@RequestMapping(value="/notice/delete")
	public String noticeDelete(HttpServletRequest request, Model model) {

		int notice_number = Integer.parseInt(request.getParameter("notice_number"));

		model.addAttribute("notice_number", notice_number);

		return "notice/notice_delete.tiles";
	}

	// 공지사항 삭제
	@PostMapping("/notice/deleteOk")
	public String noticeDeleteDo(HttpServletRequest request, Model model) {

		int notice_number = Integer.parseInt(request.getParameter("notice_number"));
		int check = boardService.noticeDeleteOk(notice_number);

		model.addAttribute("notice_number", notice_number);
		model.addAttribute("check", check);

		return "notice/notice_deleteOk.tiles";
	}

	// 신고 작성 화면 
	@GetMapping("/report/write")
	public String report(HttpServletRequest request, Model model) {

		String sales_number = request.getParameter("sales_number");
		String sales_title = request.getParameter("sales_title");
		
		model.addAttribute("sales_number", sales_number);
		model.addAttribute("sales_title", sales_title);

		return "report/report_write.empty";
	}

	// 신고작성 ok
	@PostMapping("/report/write")
	public String reportWriteOk(HttpSession session, ReportDto reportDto) {
		System.out.println( "reportDto : " + reportDto.toString());			// 넘어오는지 확인
		
		String member_id = (String) session.getAttribute("member_id");
		reportDto.setMember_id(member_id);
		
		boardService.reportWriteOk(reportDto);   // controller의 함수명과 같게 하는게 좋다.

		return "report/report_writeOk";
	}

	// 신고 관리자
	@GetMapping("/report/admin")			// pageNumber를 받는 파라미터를 추후에 paging 객체를 통해 받는걸로 수정해야함 
	public String reportAdmin(@RequestParam(value="pageNumber", defaultValue="1") String pageNumber, Model model) {

		List<ReportDto> reportList = boardService.getReportList(pageNumber, model);
		model.addAttribute("reportList", reportList);

		return "admin/report_admin.tiles";
	}

	// 신고 및 매물 삭제
	// TODO - 화면단에서 신고 버튼을 구현을 안함, 추후에 추가해야함 
	@GetMapping("/report/delete")
	public String deleteReport(@RequestParam int salesNumber, Model model) {
		System.out.println("salesNumber : " + salesNumber);
		
		int check = boardService.AdDelete(salesNumber); 

		model.addAttribute("check", check);
		
		return "report/delete";
	}

	// 신고 상세 확인
	@GetMapping("/report/detail")
	public String reportDetail(int report_number, Model model) {
		System.out.println("reportNumber : " + report_number);
		ReportDto reportDto = boardService.ReportDetail(report_number);
		
		model.addAttribute("reportDto", reportDto);
		
		return "report/report_detail.tiles";
	}

	// 신고 수정 
	@GetMapping("/report/update")
	public String reportUpdate(int sales_number, Model model) {
		System.out.println("sales_number : " + sales_number);
		int check = boardService.reportUpdate(sales_number);

		System.out.println("controller:"+check);
		model.addAttribute("check", check);
		
		return "report/update";
	}
}
