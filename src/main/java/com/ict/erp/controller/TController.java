package com.ict.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TController {
	
	@RequestMapping(value="/ttest/{t}", method=RequestMethod.GET)
	public String dd(Model m,@PathVariable String t) {
		m.addAttribute("page", t);
		return "test/t2";
	}

}
