package com.kitri.jejusari.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kitri.jejusari.dao.BoardDao;

@Service
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<String> testDB() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
