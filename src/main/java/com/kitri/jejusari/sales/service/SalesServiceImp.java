package com.kitri.jejusari.sales.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.common.KakaoLocalAPI;
import com.kitri.jejusari.common.PageMaker;
import com.kitri.jejusari.member.model.dto.MemberDto;
import com.kitri.jejusari.sales.model.dao.SalesDao;
import com.kitri.jejusari.sales.model.dto.SalesDto;
import com.kitri.jejusari.sales.model.dto.SalesImgDto;

@Service
public class SalesServiceImp implements SalesService {
	private static final Logger logger = LoggerFactory.getLogger(SalesServiceImp.class);

	@Autowired
	SalesDao salesDao;

	@Autowired
	private PageMaker pageMaker;

	@Override
	public void salesDetail(Model model, int sales_number, int pageNumber, String session_member_id) {
		SalesDto salesDto = salesDao.salesDetail(sales_number);
		String[] sales_option = salesDto.getSales_option().split(",");
		for (int i = 0; i < sales_option.length; i++) {
			if (sales_option[i].equals("풀옵션"))
				salesDto.setSales_full(1);
			
			if (sales_option[i].equals("주차장"))
				salesDto.setSales_parking(1);
			
			if (sales_option[i].equals("CCTV"))
				salesDto.setSales_cctv(1);
			
			if (sales_option[i].equals("엘리베이터"))
				salesDto.setSales_ele(1);
		}

		int scrap_check = 0;
		if (session_member_id != null) {
			Map<String, Object> map = new HashMap<>();
			map.put("member_id", session_member_id);
			map.put("sales_number", salesDto.getSales_number());
			scrap_check = salesDao.salesScrapCheck(map);
		}

		String member_id = salesDto.getMember_id();
		MemberDto memberDto = salesDao.salesBroker(member_id);

		int scrap_count = salesDao.salesScrapCount(sales_number);

		List<SalesImgDto> salesImgDtoList = salesDao.selectSalesImg(sales_number);
		
		// 해당 매물의 지수 정보 가져오기
		Map<String, Object> factorMap = salesDao.getFactor(sales_number);
		if (factorMap != null) logger.info(factorMap.toString());

		// 매물더미데이터 업데이트_한번 돌리면 될듯?합니다?
		/*
		 * for(int i=1;i<=123;i++) { if(i==57) continue; if(i==113) continue;
		 * Map<String, Object> factorMap_update = salesDao.getFactor(i); int
		 * check=salesDao.updateSalesDB(factorMap_update); }
		 */
		float factor_all_avg = salesDao.totalAvg();
		
		model.addAttribute("salesImgDtoList", salesImgDtoList);
		model.addAttribute("factor_all_avg", factor_all_avg);
		model.addAttribute("scrap_count", scrap_count);
		model.addAttribute("scrap_check", scrap_check);
//		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("salesDto", salesDto);
		model.addAttribute("factorMap", factorMap);
	}

	@Override
	public HashMap<String, Object> salesUpdate(int sales_number) {

		SalesDto salesDto = salesDao.salesDetail(sales_number);
		String[] sales_option = salesDto.getSales_option().split(",");
		
		for (int i = 0; i < sales_option.length; i++) {
			if (sales_option[i].equals("풀옵션"))
				salesDto.setSales_full(1);
			if (sales_option[i].equals("주차장"))
				salesDto.setSales_parking(1);
			;
			if (sales_option[i].equals("CCTV"))
				salesDto.setSales_cctv(1);
			if (sales_option[i].equals("엘리베이터"))
				salesDto.setSales_ele(1);
		}
		
		List<SalesImgDto> salesImgDtoList = salesDao.selectSalesImg(sales_number);
		logger.info("urlname : {}", salesImgDtoList.toString());
		
		String urlname = null;
		List<String> urlNameList = new ArrayList<String>();
		
		for (int i = 0; i < salesImgDtoList.size(); i++) {
			urlname = salesImgDtoList.get(i).getImage_url().split("\\\\")[2];
			urlNameList.add(urlname);
		}
		
		logger.info("urlNameList : {}", urlNameList.toString());
		String urlNameAll = urlNameList.toString();
		
		HashMap<String, Object> model = new HashMap<String,Object>();
		model.put("urlNameAll", urlNameAll);
		model.put("salesDto", salesDto);

		return model;
	}

	@Override
	public int salesUpdateOk(Map<String, Object> map) {
		
		SalesDto salesDto = (SalesDto) map.get("salesDto");
		String safeFile = (String) map.get("safeFile");
		
		if (!safeFile.equals("none")) {
			safeFile = safeFile.substring(safeFile.indexOf("psd") - 1, safeFile.length());
			SalesImgDto salesImgDto = new SalesImgDto();
			salesImgDto.setImage_url(safeFile);
			salesDao.updateSalesImg(salesImgDto);
		}
		System.out.println(salesDto.toString());
		map.put("salesDto", salesDto);

		int check = salesDao.salesUpdate(map);
		System.out.println("updateOk:" + check);
		
		return check;
	}

	@Override
	public MemberDto salesBroker(String member_id) {
		MemberDto memberDto = salesDao.salesBroker(member_id);
		return memberDto;
	}

	@Override
	public int salesScrap(Map<String, Object> map) {
		logger.info("member_id {}, sales_number {}",map.get("member_id"),map.get("sales_number"));
		
		int check = 0;
		int scrap_check = salesDao.salesScrapCheck(map);
		if (scrap_check == 0) { // 스크랩추가
			int ok = salesDao.salesScrapDo(map);
			if (ok > 0)
				check = 1;
		} else { // 스크랩삭제
			int ok = salesDao.salesScrapDelete(map);
			if (ok > 0)
				check = -1;
		}
		
		return check;
	}

	@Override
	public List<SalesDto> salesList(SalesDto salesDto) {

		// count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count = salesDao.salesCount(salesDto);
		List<SalesDto> salesList = null;
		
		if (count > 0) {
			salesList = salesDao.salesList(salesDto);
		}
		
		return salesList;
	}

	@Override
	public int salesWriteOk(SalesDto salesDto, String safeFile) {

		safeFile = safeFile.substring(safeFile.indexOf("psd") - 1, safeFile.length());

		int check = salesDao.salesWriteOk(salesDto);
		SalesImgDto salesImgDto = new SalesImgDto();
		salesImgDto.setImage_url(safeFile);
		int sales_number = 0;

		if (check > 0) {
			sales_number = salesDao.getSalesNumber(salesDto.getMember_id());

			String address = getAddress(sales_number);
			List<String> factors = KakaoLocalAPI.kakaoAPI(address);
			Map<String, Object> factorMap = KakaoLocalAPI.getFactorMap(factors);
			factorMap.put("sales_number", sales_number);

			// DB에 전달
			salesDao.insertFactor(factorMap);

			// Sales_Img DB에 전달
			salesImgDto.setSales_number(sales_number);
			salesDao.insertSalesImg(salesImgDto);
		}
		salesImgDto.setImage_url(safeFile);
		salesImgDto.setSales_number(sales_number);

		return sales_number;
	}

	@Override
	public int salesDeleteOk(int sales_number) {
		
		SalesDto salesDto = new SalesDto();
		salesDto.setSales_number(sales_number);

		int check = salesDao.salesDelete(salesDto);

		System.out.println("check : " + check);
		logger.info("check {}", check);

		return check;
	}

	@Override
	public String salesIdCheck(int sales_number) {
		return salesDao.salesIdCheck(sales_number);
	}

	@Override
	public String getAddress(int sales_number) {
		return salesDao.getAddress(sales_number);
	}

	@Override
	public int salesCount(SalesDto salesDto) {
		return salesDao.salesCount(salesDto);
	}

}
