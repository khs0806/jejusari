package com.kitri.jejusari.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.common.KakaoLocalAPI;
import com.kitri.jejusari.dao.SalesDao;
import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.PageMaker;
import com.kitri.jejusari.dto.SalesDto;

@Service
public class SalesServiceImp implements SalesService {
	
	@Autowired
	SalesDao salesDao;

	@Autowired
	private PageMaker pageMaker;
	
	@Override
	public void salesDetail(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int sales_number=Integer.parseInt(request.getParameter("sales_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		HttpSession session=request.getSession();
//====================================================================================
		// by.gustn
		// 더미 매물DB를 이용하여 지수테이블에 인서트하는 코드 <필독>
		// 매물게시물 읽을 때 지수 테이블에 해당 게시물의 지수5개가 입력되게 한다.
		// 이런식으로 더미 매물DB의 지수를 전부 지수테이블에 인서트한다.
		
//		String address = getAddress(sales_number);
//		System.out.println("address : " + address);
//		List<String> factors = KakaoLocalAPI.kakaoAPI(address);
//		System.out.println(factors.toString());
//		Map<String, Object> factorMap = new HashMap<String, Object>();
//		factorMap.put("factor_gas", factors.get(0));
//		factorMap.put("factor_mart", factors.get(1));
//		factorMap.put("factor_public", factors.get(2));
//		factorMap.put("factor_hospital", factors.get(3));
//		factorMap.put("factor_tour", factors.get(4));
//		int sum = 0;
//		for(int i=0; i<factors.size(); i++) {
//			sum += Integer.parseInt(factors.get(i));
//		}
//		factorMap.put("factor_total", sum);
//		factorMap.put("sales_number", sales_number);
//		System.out.println(factorMap.toString());
//		salesDao.insertFactor(factorMap);
//===================================================================================
		
		String session_member_id=(String) session.getAttribute("member_id");
		mav.addObject("session_member_id",session_member_id);
		System.out.println(session_member_id);
		
		SalesDto salesDto=salesDao.salesDetail(sales_number);
		String[] sales_option=salesDto.getSales_option().split(",");
		for(int i=0;i<sales_option.length;i++) {
			if(sales_option[i].equals("풀옵션")) salesDto.setSales_full(1);
			if(sales_option[i].equals("주차장")) salesDto.setSales_parking(1);;
			if(sales_option[i].equals("CCTV")) salesDto.setSales_cctv(1);
			if(sales_option[i].equals("엘리베이터")) salesDto.setSales_ele(1);
		}
		
		if(session_member_id!=null) {
			map.put("member_id",session_member_id);
			map.put("sales_number",salesDto.getSales_number());
			int scrap_check=salesDao.salesScrapCheck(map);
			mav.addObject("scrap_check",scrap_check);
		}
		
		String member_id=salesDto.getMember_id();
		MemberDto memberDto=salesDao.salesBroker(member_id); 
		
		int scrap_count=salesDao.salesScrapCount(sales_number);
		
		// by.gustn
		// 해당 매물의 지수 정보 가져오기
		Map<String, Object> factorMap = salesDao.getFactor(sales_number);
		System.out.println(factorMap.toString());
		
		//매물더미데이터 업데이트_한번 돌리면 될듯?합니다?
/*		for(int i=1;i<=123;i++) {
			if(i==57) continue;
			if(i==113) continue;
			Map<String, Object> factorMap_update = salesDao.getFactor(i);		
			int check=salesDao.updateSalesDB(factorMap_update);
		}
*/		
		int factor_total_all=salesDao.totalAll();
		mav.addObject("factor_total_all",factor_total_all);
		
		mav.addObject("scrap_count",scrap_count);
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("memberDto",memberDto);
		mav.addObject("salesDto",salesDto);
		mav.addObject("factorMap",factorMap);
		mav.setViewName("sales/sales_details.tiles");
	}
	
	@Override
	public void salesUpdate(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		int sales_number=Integer.parseInt(request.getParameter("sales_number"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));

		SalesDto salesDto=salesDao.salesDetail(sales_number);
		String[] sales_option=salesDto.getSales_option().split(",");
		for(int i=0;i<sales_option.length;i++) {
			if(sales_option[i].equals("풀옵션")) salesDto.setSales_full(1);
			if(sales_option[i].equals("주차장")) salesDto.setSales_parking(1);;
			if(sales_option[i].equals("CCTV")) salesDto.setSales_cctv(1);
			if(sales_option[i].equals("엘리베이터")) salesDto.setSales_ele(1);
		}
		
		mav.addObject("pageNumber",pageNumber);
		mav.addObject("salesDto",salesDto);
		mav.setViewName("sales/sales_update.tiles");
	}
	
	@Override
	public void salesUpdateOk(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		SalesDto salesDto=(SalesDto) map.get("salesDto");
		System.out.println(request+"\t"+salesDto);
		
	}
	
	@Override
	public void salesBroker(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String member_id=request.getParameter("member_id");
		
		MemberDto memberDto=salesDao.salesBroker(member_id); 
		
		mav.addObject("memberDto",memberDto);
		mav.setViewName("sales/sales_broker.empty");
	}
	
	@Override
	public int salesScrap(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
		
		int sales_number=Integer.parseInt(request.getParameter("sales_number"));
		String member_id=(String) session.getAttribute("member_id");
		System.out.println(sales_number+" , "+member_id);
		map.put("sales_number",sales_number);
		map.put("member_id", member_id);
		
		int check=0;
		int scrap_check=salesDao.salesScrapCheck(map);
		if(scrap_check==0) {		//스크랩추가
			int ok=salesDao.salesScrapDo(map);
			if(ok>0) check=1;
		}else {				//스크랩삭제
			int ok=salesDao.salesScrapDelete(map);
			if(ok>0) check=-1;
		}
		return check;
	}

	@Override
	public void salesList(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		SalesDto salesDto=(SalesDto)map.get("salesDto");
		
		//페이징
//		String pageNumber=request.getParameter("pageNumber");
//		if(pageNumber==null) pageNumber="1";
//		int currentPage=Integer.parseInt(pageNumber);	//요청한 페이지
//		int boardSize=10;		// [1] start:1, end:10  [2] start:11, end:20
//		
//		int startRow=(currentPage-1)*boardSize+1;	//1  11 21 31
//		int endRow=currentPage*boardSize;			//10 20 30 40
		
		
		
		// dao에 있던 기능 정리
		Map<String, Object> hmap=new HashMap<String, Object>();
		String[] sales_category_type_list=null;
		if(salesDto.getSales_category_type()!=null) {
			 sales_category_type_list = salesDto.getSales_category_type().split(",");
		}
		String[] sales_option_list=null;
		if(salesDto.getSales_option()!=null) {
			sales_option_list=salesDto.getSales_option().split(",");
		}
		
	
		hmap.put("sales_category_rent", salesDto.getSales_category_rent());
		hmap.put("sales_category_type_list", sales_category_type_list);
		hmap.put("sales_option_list", sales_option_list);
		hmap.put("sales_address", salesDto.getSales_address());	//검색키워드
		
		//count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count=salesDao.salesCount(hmap);
		List<SalesDto> salesList=null;
		
		pageMaker.setCri(salesDto);
		pageMaker.setTotalCount(count);
		
		hmap.put("startRow", salesDto.getStartRow());
		hmap.put("endRow", salesDto.getEndRow());		
		
		if(count>0) {
			//startRow, endRow
			salesList=salesDao.salesList(hmap);
			//System.out.println("saleslist : " + salesList.toString());
		}
		
		mav.addObject("salesList", salesList);
		mav.addObject("pageMaker", pageMaker);
		mav.setViewName("sales/sales_list.tiles");
	}

	@Override
	public void salesWriteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		SalesDto salesDto=(SalesDto)map.get("salesDto");
		System.out.println(salesDto.toString());
		int check = salesDao.salesWriteOk(salesDto);
		if (check > 0) {
			int sales_number = salesDao.getSalesNumber(salesDto.getMember_id());
			
			String address = getAddress(sales_number);
			System.out.println("address : " + address);
			List<String> factors = KakaoLocalAPI.kakaoAPI(address);
			System.out.println(factors.toString());
			Map<String, Object> factorMap = new HashMap<String, Object>();
			
			// 지수map에 데이터 담기
			factorMap.put("factor_gas", factors.get(0));
			factorMap.put("factor_mart", factors.get(1));
			factorMap.put("factor_public", factors.get(2));
			factorMap.put("factor_hospital", factors.get(3));
			factorMap.put("factor_tour", factors.get(4));
			
			// 지수 토탈점수 구하기
			int sum = 0;
			for(int i=0; i<factors.size(); i++) {
				sum += Integer.parseInt(factors.get(i));
			}
			factorMap.put("factor_total", sum);
			factorMap.put("sales_number", sales_number);
			System.out.println(factorMap.toString());
			
			// DB에 전달
			salesDao.insertFactor(factorMap);
		}
	}
	
	@Override
	public void salesDeleteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		System.out.println(request.getParameter("sales_number"));
		int sales_number = Integer.parseInt(request.getParameter("sales_number"));
		SalesDto salesDto = new SalesDto();
		salesDto.setSales_number(sales_number);
		
		
		int check1 = salesDao.salesDelete1(salesDto);
		int check2 = salesDao.salesDelete2(salesDto);
		int check3 = salesDao.salesDelete3(salesDto);
		int check4 = salesDao.salesDelete4(salesDto);
		int check5 = salesDao.salesDelete5(salesDto);
		
		System.out.println("check : " + check1 + check2+check3+check4+check5);
		
		
		mav.addObject("check1", check1);
		mav.addObject("check2", check2);
		mav.addObject("check3", check3);
		mav.addObject("check4", check4);
		mav.addObject("check5", check5);
		mav.setViewName("sales/sales_deleteOk.tiles");
		
	}
	
	@Override
	public String salesIdCheck(int sales_number) {
		return salesDao.salesIdCheck(sales_number);
	}
	
	@Override
	public String getAddress(int sales_number) {
		return salesDao.getAddress(sales_number);
	}
	
}
