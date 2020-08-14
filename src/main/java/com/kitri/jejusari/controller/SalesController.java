package com.kitri.jejusari.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dto.SalesDto;
import com.kitri.jejusari.service.SalesService;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService salesService;
	
	@RequestMapping(value="/sales")
	public ModelAndView salesList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		salesService.salesList(mav);
		return mav;
	}
	
	@RequestMapping(value="/sales/write")
	public String salesWrite(HttpServletRequest request, HttpServletResponse response) {
		
		return "sales/sales_write.tiles";
	}
	
	@RequestMapping(value="/sales/writeOk")
	public String salesWriteOk(HttpServletRequest request, HttpServletResponse response, SalesDto salesDto) {
		
		ModelAndView mav= new ModelAndView();
		mav.addObject(request);
		
		//session으로 아이디 가져오고 나선 없어질 코드
		salesDto.setMember_id("kke");
		//System.out.println(salesDto);
		
		mav.addObject("salesDto", salesDto);
		salesService.salesWriteOk(mav);
		return "sales/sales_write.tiles";
	}
	
	@RequestMapping(value="/sales/detail")
	public ModelAndView salesDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		

		salesService.salesDetail(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/sales/broker")
	public ModelAndView salesBroker(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);

		salesService.salesBroker(mav);
		return mav;
	}
	
	@RequestMapping(value="/sales/scrap")
	public void salesScrap(HttpServletRequest request, HttpServletResponse response) throws Throwable{
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);

		int check=salesService.salesScrap(mav);
		PrintWriter out=response.getWriter();
		out.print(check);
	}	
	
	@RequestMapping(value="/sales/delete", method=RequestMethod.GET)
	public ModelAndView salesDelete(HttpServletRequest request, HttpServletResponse response) {

		
		ModelAndView mav=new ModelAndView();
		String sales_number = request.getParameter("sales_number");
		mav.addObject("sales_number", sales_number);
		mav.addObject("request", request);
		
		mav.setViewName("sales/sales_delete");
		
		return mav; 
		
	}
	

	@RequestMapping(value="/sales/delete", method=RequestMethod.POST)
	public ModelAndView salesDeleteOk(HttpServletRequest request, HttpServletResponse response, SalesDto salesDto) {
		
		System.out.println( "salesDto : " + salesDto.toString());			// 넘어오는지 확인
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		int sales_number = Integer.parseInt(request.getParameter("sales_number"));
		System.out.println(sales_number);
		HttpSession session = request.getSession();
		
		String member_id = (String) session.getAttribute("user");
		String db_id = salesService.salesIdCheck(sales_number);
		
		if(member_id.equals(db_id)) {
			salesService.salesDeleteOk(mav);
		} else {
			mav.addObject("check", "0");
		}
		
		mav.setViewName("sales/sales_deleteOk");
		
		return mav;
	}
	
	
	/** 이미지 관련 controller 함수..! 작성중입니다.(kke) */
	@RequestMapping(value="/uploadSummernoteImageFile", method=RequestMethod.POST)
	@ResponseBody
	public JSONObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		JSONObject obj=new JSONObject();
		
		String fileRoot="C:\\jejusari\\summernote_img\\";		//저장될 외부 파일 경로
		//없는 경로면 생성하는 코드 만들어야하지 않나??
		String originalFileName=multipartFile.getOriginalFilename();	//오리지날 파일명
		String extention = originalFileName.substring(originalFileName.lastIndexOf("."));	//확장자명
		
		String savedFileName=UUID.randomUUID()+extention;		//저장될 파일 명
		File targetFile=new File(fileRoot+savedFileName);
		
		try {
			InputStream fileStream=multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일저장
			obj.put("url", "/jejusari/summernote_img/"+savedFileName);
			obj.put("responseCode", "success");
			
		}catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);	//실패시 저장된 파일 삭제
			obj.put("responseCode", "error");
			e.printStackTrace();
		}
		return obj;
	}
	
	@RequestMapping(value="/sales/update")
	public ModelAndView salesUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);

		salesService.salesUpdate(mav);
		return mav;
	}
	
	@RequestMapping(value="/sales/updateOk", method=RequestMethod.POST)
	public ModelAndView salesUpdateOk(HttpServletRequest request, HttpServletResponse response,SalesDto salesDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("salesDto",salesDto);
		
		salesService.salesUpdateOk(mav);
		return mav;
	}
}
