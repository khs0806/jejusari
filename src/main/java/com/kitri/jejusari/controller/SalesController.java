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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dto.SalesDto;
import com.kitri.jejusari.service.SalesService;



@Controller
public class SalesController {
	
	private static final String realPath = null;
	@Autowired
	private SalesService salesService;
	
	@RequestMapping(value="/sales")
	public ModelAndView salesList(HttpServletRequest request, HttpServletResponse response, SalesDto salesDto) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		mav.addObject("salesDto", salesDto);
		salesService.salesList(mav);
		return mav;
	}
	
	@RequestMapping(value="/sales/write")
	public String salesWrite(HttpServletRequest request, HttpServletResponse response) {
		
		return "sales/sales_write.tiles";
	}
	
	@RequestMapping(value="/sales/writeOk", method=RequestMethod.POST)
	public String salesWriteOk(HttpServletRequest request, HttpServletResponse response, SalesDto salesDto,
			@RequestParam(value="file", required = false) MultipartFile mf) {
		
		ModelAndView mav= new ModelAndView();
		
		String SAVE_PATH = "D:\\Desktop\\KITRI\\jejusari\\git\\work\\Jejusari\\src\\main\\webapp\\WEB-INF\\psd";
		
		String originalFileName = mf.getOriginalFilename();
		long fileSize = mf.getSize();
		String safeFile = SAVE_PATH + System.currentTimeMillis() + originalFileName;

		try {
			mf.transferTo(new File(safeFile));

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("safeFile", safeFile);
		mav.addObject("request", request);
		HttpSession session = request.getSession();
		//session으로 아이디 가져오고 나선 없어질 코드
		salesDto.setMember_id((String)session.getAttribute("member_id"));
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
		
		
	
		salesService.salesDeleteOk(mav);

		
		return mav;
	}
	
	
	/** 이미지 관련 controller 함수..! 작성중입니다.(kke) */
	@RequestMapping(value="/uploadSummernoteImageFile", method=RequestMethod.POST)
	public ResponseEntity<JSONObject> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		//여기로 넘어오질 못하네...400 error
		System.out.println("넘어왔어용");
		JSONObject obj=new JSONObject();
		//String fileRoot="C:\\jejusari\\summernote_img\\";		//저장될 외부 파일 경로
		String fileRoot="img\\summernote_img\\";		//저장될 외부 파일 경로
		String realPath="C:\\apache-tomcat-9.0.37\\wtpwebapps\\Jejusari\\";
		String workPath="C:\\Users\\user\\Desktop\\JEJUSARI\\workspace2\\Jejusari\\src\\main\\webapp\\";
		//String realPath=request.getSession().getServletContext().getRealPath("");
		//System.out.println(realPath+fileRoot);
		
		//없는 경로면 생성하는 코드 만들어야하지 않나??
		String originalFileName=multipartFile.getOriginalFilename();	//오리지날 파일명
		String extention = originalFileName.substring(originalFileName.lastIndexOf("."));	//확장자명
		
		System.out.println(originalFileName);
		String savedFileName=UUID.randomUUID()+extention;		//저장될 파일 명
		File targetFile1=new File(realPath+fileRoot+savedFileName);
		File targetFile2=new File(workPath+fileRoot+savedFileName);
		
		try {
			InputStream fileStream1=multipartFile.getInputStream();
			InputStream fileStream2=multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream1, targetFile1);	//파일저장
			FileUtils.copyInputStreamToFile(fileStream2, targetFile2);	//파일저장
			obj.put("url", "/jeju/img/summernote_img/"+savedFileName);
			obj.put("filename", originalFileName);
			obj.put("responseCode", "success");
		}catch(IOException e) {
			FileUtils.deleteQuietly(targetFile1);	//실패시 저장된 파일 삭제
			FileUtils.deleteQuietly(targetFile2);	//실패시 저장된 파일 삭제
			obj.put("responseCode", "error");
			e.printStackTrace();
		}
		System.out.println(obj.toJSONString());
		System.out.println(new ResponseEntity<JSONObject>(obj, HttpStatus.OK).toString());
		ResponseEntity<JSONObject> d=new ResponseEntity<JSONObject>(obj, HttpStatus.OK);
		return d;
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
		System.out.println(request.getParameter("sales_number"));
		mav.addObject("request",request);
		mav.addObject("salesDto",salesDto);
		
		salesService.salesUpdateOk(mav);
		return mav;
	}

}
