package com.ict.erp.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.erp.service.LevelService;
import com.ict.erp.vo.LevelInfo;

@Controller
public class LevelTController { 
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private LevelService ls;
	
//	@RequestMapping(value="/levelinfo", method=RequestMethod.GET)
//	public String getLevelInfoList(Model m, @RequestParam Map<String,String> map) {
//		map.put(map.get("op"), map.get("sch"));
//				System.out.println(map);
//		m.addAttribute("liList", ls.getLevelInfoList(null));
//		return "levelinfo/list";
//	}
	
	
	@RequestMapping(value="/levelinfodelete", method=RequestMethod.DELETE)
	public String levelInfoDelete(Model m, @RequestParam List<Integer> linum) {
		System.out.println(linum);
		System.out.println("델리트 타니");
		m.addAttribute("resultD", ls.getLevelDelete(linum));
		
		return "levelinfo/url/levelinfo:list";
	}
	
	

	
//	@RequestMapping(value="/levelinfoMap", method=RequestMethod.GET)
//	public String getLevelInfoListModel(Model m, @RequestParam Map<String,String> map, @RequestParam("sch") String liname) {
//		System.out.println(map);
//		
//		
//		
//		m.addAttribute("liList", ls.getLevelInfoList(null));
//		return "levelinfo/list";
//	}
//	
//	@RequestMapping(value="/levelinfoNum/{linum}", method=RequestMethod.GET)
//	public String getLevelInfoListVar(Model m, @PathVariable int linum) {
//		System.out.println(linum);
//		
//		m.addAttribute("liList", ls.getLevelInfoList(null));
//		return "levelinfo/list";
//	}
//	
//	
//	@RequestMapping(value="/levelinfo2", method=RequestMethod.GET)
//	public ModelAndView getLevelInfoList2(ModelAndView mav, @ModelAttribute LevelInfo li) {
//		System.out.println(li);
//		
//		mav.setViewName("levelinfo/list");
//		mav.addObject("liList", ls.getLevelInfoList(null));
//		return mav;
//	}
	
	
	
	
}
