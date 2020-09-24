package com.kitri.jejusari.sales.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.common.PageMaker;
import com.kitri.jejusari.member.controller.MemberController;
import com.kitri.jejusari.member.model.dto.MemberDto;
import com.kitri.jejusari.sales.model.dto.SalesDto;
import com.kitri.jejusari.sales.service.SalesService;

@Controller
public class SalesController {
	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);
	private static final String realPath = null;

	@Autowired
	SalesService salesService;

	@Autowired
	HttpSession session;

	@GetMapping("/sales")
	public String salesList(Model model, SalesDto salesDto) {
		
		Map<String, Object> hmap = salesService.salesList(salesDto);
		model.addAttribute("salesList", hmap.get("salesList"));
		model.addAttribute("pageMaker", hmap.get("pageMaker"));
		
		return "sales/sales_list.tiles";
	}
	
	@GetMapping("/sales/write")
	public String salesWrite() {
		
		return "sales/sales_write.tiles";
	}
	
	@PostMapping("/sales/writeOk")
	public String salesWriteOk(SalesDto salesDto, Model model, HttpServletRequest request,
			@RequestParam(value = "thumbnail", required = false) MultipartFile mf) {
		
		// 서블릿 컨텍스트의 물리적 실제 경로(/webapp)을 불러와서 /psd/ 경로를 추가한다.
		String SAVE_PATH = request.getSession().getServletContext().getRealPath("psd/");
		System.out.println("rootPath : " + SAVE_PATH);
		
		String originalFileName = mf.getOriginalFilename();
		String safeFile = SAVE_PATH + System.currentTimeMillis() + originalFileName;
		
		try {
			mf.transferTo(new File(safeFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		salesDto.setMember_id((String) session.getAttribute("member_id"));
		int sales_number = salesService.salesWriteOk(salesDto, safeFile);
		int check = 0;
		if (sales_number != 0) {
			check = 1;
		}

		model.addAttribute("check", check);
		model.addAttribute("sales_number", sales_number);

		return "sales/sales_insertCheck";

	}

	@GetMapping("/sales/detail")
	public String salesDetail(Model model, int sales_number, @ModelAttribute("pageNumber") int page_number) {

		String session_member_id = (String) session.getAttribute("member_id");
		logger.info("session_member_id : {}",session_member_id);
		salesService.salesDetail(model, sales_number, page_number, session_member_id);
		
		return "sales/sales_details.tiles";
	}

	@GetMapping("/sales/broker")
	public String salesBroker(String member_id, Model model) {
		
		MemberDto memberDto = salesService.salesBroker(member_id);
		model.addAttribute("memberDto", memberDto);
		
		return "sales/sales_broker.empty";
	}

	@ResponseBody
	@GetMapping("/sales/scrap")
	public int salesScrap(HttpServletRequest request) throws Throwable {
		
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		String sales_number = request.getParameter("sales_number");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("sales_number", sales_number);

		int check = salesService.salesScrap(map);
		
		return check;
	}

	@GetMapping("/sales/delete")
	public String salesDelete(@ModelAttribute("sales_number") String sales_number) {
		logger.info("sales_number {}", sales_number);
		
		return "sales/sales_delete";

	}

	@PostMapping("/sales/delete")
	public String salesDeleteOk(int sales_number, Model model) {
		logger.info("sales_number {}", sales_number);
		int check = salesService.salesDeleteOk(sales_number);
			
		model.addAttribute("check", check);
		
		return "sales/sales_deleteOk.tiles";
	}

	/** 이미지 관련 controller 함수..! 작성중입니다.(kke) */
	@PostMapping(value = "/uploadSummernoteImageFile")
	public ResponseEntity<JSONObject> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		// 여기로 넘어오질 못하네...400 error
		System.out.println("넘어왔어용");
		String realpath = request.getSession().getServletContext().getRealPath("/");
		logger.info("realPath {}", realpath);
		
		JSONObject obj = new JSONObject();
		// String fileRoot="C:\\jejusari\\summernote_img\\"; //저장될 외부 파일 경로
		String fileRoot = "img\\summernote_img\\"; // 저장될 외부 파일 경로
		// 경은path
//		String realPath="C:\\apache-tomcat-9.0.37\\wtpwebapps\\Jejusari\\";
//		String workPath="C:\\Users\\user\\Desktop\\JEJUSARI\\workspace2\\Jejusari\\src\\main\\webapp\\";

		// 경은 kitri
		String realPath = "C:\\Kitri2020\\mvc\\apache-tomcat-9.0.35\\wtpwebapps\\JejusariProject\\";
		String workPath = "C:\\Kitri2020\\jeju\\JejusariProject\\src\\main\\webapp\\";

		// 윤정path
//		String realPath = "C:\\CHOIYJ\\spring\\download\\apache-tomcat-9.0.35\\wtpwebapps\\jejusari\\";
//		String workPath = "C:\\CHOIYJ\\git\\work\\jejusari\\src\\main\\webapp\\";

		// 정인path
		// String realPath =
		// "C:\\lji\\mvc\\apache-tomcat-9.0.35\\wtpwebapps\\jejusari\\";
		// String workPath = "C:\\lji\\git\\work\\jejusari\\src\\main\\webapp\\";

		// 수인path
		// String realPath =
		// "C:\\Users\\LG-PC\\Desktop\\git\\apache-tomcat-9.0.35\\wtpwebapps\\jejusari\\";
		// String workPath =
		// "C:\\Users\\LG-PC\\Desktop\\git\\work\\jejusari\\src\\main\\webapp\\";

		// 상후path
//		String realPath = "D:\\Desktop\\KITRI\\mvc\\apache-tomcat-9.0.35\\wtpwebapps\\Jejusari\\";
//		String workPath = "D:\\Desktop\\KITRI\\jejusari\\git\\work\\Jejusari\\src\\main\\webapp\\";

		// 현수path
//		String realPath = "C:\\Users\\김현수\\Desktop\\khsworkspace\\한국정보연구기술원\\KHS\\spring\\download\\apache-tomcat-9.0.35\\wtpwebapps\\jejusari\\";
//		String workPath = "C:\\Users\\김현수\\Desktop\\hsworkspace\\한국정보연구기술원\\프로젝트\\git\\projectworkspace\\jejusari\\src\\main\\webapp\\";

		// 동준path
		// String realPath = "";
		// String workPath = "";
		// String realPath=request.getSession().getServletContext().getRealPath("");
		// System.out.println(realPath+fileRoot);

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extention = originalFileName.substring(originalFileName.lastIndexOf(".")); // 확장자명

		System.out.println(originalFileName);
		String savedFileName = UUID.randomUUID() + extention; // 저장될 파일 명
		File targetFile1 = new File(realPath + fileRoot + savedFileName);
		File targetFile2 = new File(workPath + fileRoot + savedFileName);

		try {
			InputStream fileStream1 = multipartFile.getInputStream();
			InputStream fileStream2 = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream1, targetFile1); // 파일저장
			FileUtils.copyInputStreamToFile(fileStream2, targetFile2); // 파일저장
			obj.put("url", "/jeju/img/summernote_img/" + savedFileName);
			obj.put("filename", originalFileName);
			obj.put("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile1); // 실패시 저장된 파일 삭제
			FileUtils.deleteQuietly(targetFile2); // 실패시 저장된 파일 삭제
			obj.put("responseCode", "error");
			e.printStackTrace();
		}
		System.out.println(obj.toJSONString());
		System.out.println(new ResponseEntity<JSONObject>(obj, HttpStatus.OK).toString());
		ResponseEntity<JSONObject> d = new ResponseEntity<JSONObject>(obj, HttpStatus.OK);
		return d;
	}

	@GetMapping("/sales/update")
	public ModelAndView salesUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		salesService.salesUpdate(mav);
		return mav;
	}

	@PostMapping("/sales/updateOk")
	public ModelAndView salesUpdateOk(HttpServletRequest request, HttpServletResponse response, SalesDto salesDto,
			@RequestParam(value = "thumbnail", required = false) MultipartFile mf) {
		ModelAndView mav = new ModelAndView();

		String SAVE_PATH = "C:/Kitri2020/jeju/JejusariProject/src/main/webapp/psd";

		String originalFileName = mf.getOriginalFilename();
		
		System.out.println(originalFileName);
		System.out.println("확인: " + salesDto);

		String safeFile = null;

		if (mf.getSize() != 0) {
			originalFileName = mf.getOriginalFilename();
			safeFile = SAVE_PATH + System.currentTimeMillis() + originalFileName;

		} else {
			safeFile = "none";
		}

		try {
			mf.transferTo(new File(safeFile));

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		mav.addObject("safeFile", safeFile);
		mav.addObject("request", request);
		mav.addObject("salesDto", salesDto);

		salesService.salesUpdateOk(mav);

		return mav;
	}

}
