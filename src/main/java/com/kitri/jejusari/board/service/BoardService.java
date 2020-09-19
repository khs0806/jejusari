package com.kitri.jejusari.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.kitri.jejusari.dto.NoticeDto;
import com.kitri.jejusari.dto.ReportDto;

public interface BoardService {
	
	//뉴스 게시판 리스
	public List<Map<String, Object>> newsList();
	
	//공지사항 게시판 리스트
	public List<NoticeDto> noticeList(Model model);
	
	//공지사항 게시판 읽기
	public NoticeDto noticeDetail(int noticeNumber); 
	
	//공지사항 게시판 작성 완료
	public int noticeWriteOk(NoticeDto noticeDto);
	
	//공지사항 삭제
	public int noticeDeleteOk(int noticeNumber);
	
	//공지사항 수정
	
	//기존의 공지사항 화면 출력 
	public NoticeDto noticeUpdate(int noticeNumber);
	
	//공지사항 수정 완료
	public int noticeUpdateOk(NoticeDto noticeDto);
	
	//신고 작성
	public int reportWriteOk(ReportDto reportDto);
	
	//신고내역리스트
	public List<ReportDto> getReportList(String pageNumber, Model model);
	
	//신고 및 매물 삭제
	public int AdDelete(int sales_number); 
	
	//신고 상세 보기
	public ReportDto ReportDetail(int report_number);
	
	//신고처리 업데이트
	public int reportUpdate(int sales_number);
	
}
