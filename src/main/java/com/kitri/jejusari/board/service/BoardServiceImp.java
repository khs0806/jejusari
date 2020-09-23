package com.kitri.jejusari.board.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.parser.ContainerFactory;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.kitri.jejusari.board.model.dao.BoardDao;
import com.kitri.jejusari.board.model.dto.NoticeDto;
import com.kitri.jejusari.board.model.dto.ReportDto;

@Service
public class BoardServiceImp implements BoardService {

	@Autowired
	BoardDao boardDao;

	@Override
	public List<Map<String, Object>> newsList() {
		String clientId = "nRMcm30QpjGM_zMZaO_f"; // 애플리케이션 클라이언트 아이디값"
		String clientSecret = "4rZaN1wN27"; // 애플리케이션 클라이언트 시크릿값"

		String text = null;
		try {
			text = URLEncoder.encode("제주도 힐링", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text + "&display=" + 20 + "&sort=sim"; // json
		// 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);

		// System.out.println(responseBody);

		JSONParser jsonParser = new JSONParser();

		ContainerFactory orderedKeyFactory = new ContainerFactory() {

			@Override
			public Map createObjectContainer() {
				return new HashMap();
			}

			@Override
			public List creatArrayContainer() {
				return new ArrayList();
			}
		};

		Object obj = null;

		try {
			obj = jsonParser.parse(responseBody, orderedKeyFactory);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		HashMap map = (HashMap) obj;
		List<Map<String, Object>> newsList = (List<Map<String, Object>>) map.get("items");

		for (int i = 0; i < newsList.size(); i++) {
			String pubDate = (String) newsList.get(i).get("pubDate"); // 기사 1개의 pubDate

			if (pubDate != null) {
				String[] dateArr = pubDate.split(" ");
				String year = dateArr[3];
				String monthEng = dateArr[2];
				String month = null;
				switch (monthEng) {
				case "Jan":
					month = "01";
					break;
				case "Feb":
					month = "02";
					break;
				case "Mar":
					month = "03";
					break;
				case "Apr":
					month = "04";
					break;
				case "May":
					month = "05";
					break;
				case "Jun":
					month = "06";
					break;
				case "Jul":
					month = "07";
					break;
				case "Aug":
					month = "08";
					break;
				case "Sep":
					month = "09";
					break;
				case "Oct":
					month = "10";
					break;
				case "Nov":
					month = "11";
					break;
				case "Dec":
					month = "12";
					break;
				default:
					month = monthEng;
					break;
				}

				String day = dateArr[1];

				String date = year + "-" + month + "-" + day;

				// newsList.get(i).remove("pubDate");
				newsList.get(i).put("date", date);
			}
		}

		System.out.println("newsList : " + newsList);

		return newsList;

	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	@Override
	public int reportWriteOk(ReportDto reportDto) {
		return boardDao.reportInsert(reportDto);
	}

	// 공지사항
	// 공지사항 게시판 읽기
	@Override
	@Transactional
	public NoticeDto noticeDetail(int noticeNumber) {

		boardDao.noticeCountPlus(noticeNumber);
		NoticeDto noticeDto = boardDao.noticeDetail(noticeNumber);
		System.out.println(noticeDto);

		return noticeDto;

	}

	// 공지사항 게시판
	@Override
	public List<NoticeDto> noticeList(Model model) {

		// 페이징
		int pageNumber = 1;
		int currentPage = pageNumber;
		int boardSize = 10;

		int startRow = (currentPage - 1) * boardSize + 1;
		int endRow = currentPage * boardSize;

		// count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count = boardDao.noticeCount();
		// int count = 0;
		System.out.println("count" + count);

		List<NoticeDto> noticeList = null;
		if (count > 0) {
			// startRow, endRow
			noticeList = boardDao.noticeList(startRow, endRow);
		}

		Map<String, Object> pageInfo = new HashMap<String, Object>();

		pageInfo.put("boardSize", boardSize);
		pageInfo.put("currentPage", currentPage);
		pageInfo.put("count", count);
		model.addAttribute("pageInfo", pageInfo);

		return noticeList;

	}

	// 공지사항 게시판 쓰기 완료
	@Override
	public int noticeWriteOk(NoticeDto noticeDto) {

		noticeDto.setNotice_date(new Date());
		noticeDto.setNotice_count(0);

		int check = boardDao.noticeWrite(noticeDto);
		System.out.println(check);

		return check;
	}

	// 공지사항 삭제 완료
	@Override
	public int noticeDeleteOk(int notice_number) {
		System.out.println(notice_number);

		int check = boardDao.noticeDelete(notice_number);
		System.out.println(check);

		return check;
	}

	// 공지사항 수정 기존의 정보 뿌리기
	@Override
	public NoticeDto noticeUpdate(int noticeNumber) {

		System.out.println("update_notice_number : " + noticeNumber);
		NoticeDto noticeDto = boardDao.noticeSelect(noticeNumber);

		return noticeDto;
	}

	// 공지사항 수정 완료
	@Override
	public int noticeUpdateOk(NoticeDto noticeDto) {

		System.out.println(noticeDto.toString());

		int check = boardDao.noticeUpdate(noticeDto);
		System.out.println("check : " + check);

		return check;
	}

	@Override
	public List<ReportDto> getReportList(String pageNumber, Model model) {
		System.out.println("pageNumber : " + pageNumber);

		// if(pageNumber == null) pageNumber = "1"; // Requestparam으로 무결성 보장하므로 주석
		int currentPage = Integer.parseInt(pageNumber); // 요청한 페이지
		int boardSize = 10; // [1] start:1, end:10 [2] start:11, end:20

		int startRow = (currentPage - 1) * boardSize + 1; // 1 11 21 31
		int endRow = currentPage * boardSize; // 10 20 30 40

		// count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count = boardDao.reportCount();
		List<ReportDto> reportList = null;

		if (count > 0) {
			// startRow, endRow
			reportList = boardDao.reportList(startRow, endRow);
		}
		System.out.println(reportList);

		model.addAttribute("boardSize", boardSize);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("count", count);

		return reportList;
	}

	@Override
	public int AdDelete(int sales_number) {
		int check = 0;
		check = boardDao.AdDelete(sales_number);

		return check;
	}

	@Override
	public ReportDto ReportDetail(int report_number) {
		ReportDto reportDto = boardDao.ReportDetail(report_number);

		return reportDto;

	}

	@Override
	public int reportUpdate(int sales_number) {
		int check = boardDao.reportUpdate(sales_number);
		System.out.println(check);

		return check;
	}

}