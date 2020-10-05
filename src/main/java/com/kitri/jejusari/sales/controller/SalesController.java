package com.kitri.jejusari.sales.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.member.model.dto.MemberDto;
import com.kitri.jejusari.sales.model.dto.SalesDto;
import com.kitri.jejusari.sales.service.SalesService;

@Controller
public class SalesController {
	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);

	@Autowired
	SalesService salesService;

	@Autowired
	HttpSession session;

	@GetMapping("/sales")
	public String salesList(Model model, SalesDto salesDto) {
		
		Map<String, Object> hmap = salesService.salesList(salesDto);
		model.addAttribute("salesList", hmap.get("salesList"));
		model.addAttribute("pageMaker", hmap.get("pageMaker"));
		model.addAttribute("active", "sales");
		
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
		
		return "sales/sales_deleteOk.empty";
	}

	@PostMapping(value = "/uploadSummernoteImageFile")
	public ResponseEntity<JSONObject> uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		
		String realpath = request.getSession().getServletContext().getRealPath("/");		// 프로젝트 실제 경로
		logger.info("realPath : {}", realpath);
		
		String fileRoot = "img\\summernote_img\\"; 											// 저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename(); 						// 오리지날 파일명
		String extention = originalFileName.substring(originalFileName.lastIndexOf(".")); 	// 확장자명
		
		String savedFileName = UUID.randomUUID() + extention; 								// 저장될 파일 명
		File savedFilePath = new File(realpath + fileRoot + savedFileName);					// 저장될 파일 경로를 입력하여 File 객체 생성
		logger.info("savedFilePath : {}", savedFilePath);
		
		HashMap<String, Object> fileJson = new HashMap<String, Object>();
		try {
			InputStream fileContent = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileContent, savedFilePath); 					// 파일저장
			fileJson.put("url", "/jejusari/img/summernote_img/" + savedFileName);
			fileJson.put("filename", originalFileName);
			fileJson.put("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(savedFilePath); 										// 실패시 저장된 파일 삭제
			fileJson.put("responseCode", "error");
			e.printStackTrace();
		}
		
		JSONObject obj = new JSONObject(fileJson);
		logger.info(new ResponseEntity<JSONObject>(obj, HttpStatus.OK).toString());
		
		return new ResponseEntity<JSONObject>(obj, HttpStatus.OK);
	}

	@GetMapping("/sales/update")
	public String salesUpdate(HttpServletRequest request, Model model, @ModelAttribute("pageNumber") int pageNumber) {
		
		int sales_number = Integer.parseInt(request.getParameter("sales_number"));

		HashMap<String, Object> salesInfo = salesService.salesUpdate(sales_number);
		model.addAttribute("urlNameAll", salesInfo.get("urlNameAll"));
		model.addAttribute("salesDto", salesInfo.get("salesDto"));
		
		return "sales/sales_update.tiles";
	}

	@PostMapping("/sales/updateOk")
	public String salesUpdateOk(HttpServletRequest request, SalesDto salesDto, Model model,
			@RequestParam(value = "thumbnail", required = false) MultipartFile mf, @ModelAttribute("pageNumber") int pageNumber) {
		logger.info("salesDto : {}", salesDto);
		
		String realPath = request.getSession().getServletContext().getRealPath("/");
		String SAVE_PATH = realPath + "psd";

		String originalFileName = null;
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
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("salesDto", salesDto);
		map.put("safeFile", safeFile);
		
		int check = salesService.salesUpdateOk(map);
		
		model.addAttribute("sales_number", salesDto.getSales_number());
		model.addAttribute("check", check);

		return "sales/sales_updateOk.tiles";
	}

}
