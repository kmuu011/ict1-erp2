package com.ict.erp.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.erp.HomeController;
import com.ict.erp.dao.NaverTransDAO;

@ControllerAdvice
public class TestAdvice {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@Autowired
	private NaverTransDAO ntd;
	
	@ExceptionHandler(value=SQLException.class)
	public @ResponseBody ResponseEntity<Map<String,String>> errorHandle(SQLException se){
		logger.error("sql error => {} ", se);
		
		
		try {
			Map<String,String> rMap = new HashMap<String,String>();
			rMap.put("error", ntd.getText(se.getMessage()));
			System.out.println(rMap);
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(rMap);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
