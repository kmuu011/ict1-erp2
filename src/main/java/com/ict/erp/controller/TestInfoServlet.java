package com.ict.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.erp.controller.test.TestServiceImpl;
import com.ict.erp.vo.LevelInfo;
import com.ict.erp.vo.TestInfo;


@Controller
public class TestInfoServlet {
	
	@Autowired
	private TestServiceImpl ts;
	
	@RequestMapping(value="/testinfo", method=RequestMethod.GET)
	public @ResponseBody List<TestInfo> getTIList(Model m, @ModelAttribute TestInfo ti) {
		return ts.getTIList(ti);
	}
	
	@RequestMapping(value="/testinfo/{tid}", method=RequestMethod.GET)
	public @ResponseBody TestInfo getTI(Model m, @PathVariable Integer tid) {
		System.out.println(tid);
		return ts.getTI(tid);
	}
	
	@RequestMapping(value="/testinfo", method=RequestMethod.POST)
	@ResponseBody
	public Integer insertTI(@RequestBody TestInfo ti) {
		System.out.println(ti);
		return ts.getInsertResult(ti);
	}
	
	

}
