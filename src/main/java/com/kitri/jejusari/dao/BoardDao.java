package com.kitri.jejusari.dao;

import java.util.List;

import com.kitri.jejusari.dto.NoticeDto;
import com.kitri.jejusari.dto.ReportDto;

public interface BoardDao {

	public int reportInsert(ReportDto reportDto);
	
	//공지사항
	//공지사항 읽기
		public NoticeDto noticeDetail(int notice_number);
		
		//공지사항 작성
		public int noticeWrite(NoticeDto noticeDto);
		
		//조회수
		public int noticeCount();
		public int noticeCountPlus(int notice_number);
		public NoticeDto noticeReadCount(int notice_number);
		
		//페이징
		public List<NoticeDto> noticeList(int startRow, int endRow);
		
		//공지사항 삭제
		public int noticeDelete(int notice_number);
		
		public NoticeDto noticeSelect(int notice_number);
		
		//공지사항 수정
		public int noticeUpdate(NoticeDto noticeDto);
}
