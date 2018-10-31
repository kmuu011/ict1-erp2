package com.ict.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.erp.vo.UserInfo;

@Controller
public class UserController {

	@RequestMapping(value="/userlogin", method=RequestMethod.POST)
	@ResponseBody
	public Integer login(@ModelAttribute UserInfo ui) {
		System.out.println("읭ㅇ");
		System.out.println(ui);
		return 1;
	}
	
}
