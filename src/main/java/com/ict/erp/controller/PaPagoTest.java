package com.ict.erp.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ict.erp.dao.NaverTransDAO;

@Controller
public class PaPagoTest {
	
	@Autowired
	private NaverTransDAO ntd;
	
	@RequestMapping(value="/ss/{txt}")
	public String test(@PathVariable String txt) {
		System.out.println(txt);
		try {
			ntd.getText(txt);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	

}
