package com.kitri.jejusari.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.BoardDao;
import com.kitri.jejusari.dto.ReportDto;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<String> testDB() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void reportWriteOk(ModelAndView mav) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map=mav.getModelMap();
		ReportDto reportDto=(ReportDto) map.get("reportDto");
		

		int check=boardDao.reportInsert(reportDto);
		System.out.println("check : " + check);
		
		mav.addObject("check", check);
		mav.setViewName("report/report_writeOk");
	}
}
