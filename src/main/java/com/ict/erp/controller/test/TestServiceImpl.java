package com.ict.erp.controller.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.erp.vo.TestInfo;

@Service
public class TestServiceImpl {
	
	@Autowired
	TestDAOImpl td;
	
	public List<TestInfo> getTIList(TestInfo ti) {
		
		return td.selectTIList(ti);		
	}
	
	public TestInfo getTI(Integer tid) {
		return td.selectTI(tid);
	}
	
	public Integer getInsertResult(TestInfo ti) {
		return td.insertTI(ti);
	}
	
	public Integer getUpdateResult(TestInfo ti) {
		return td.updateTI(ti);
	}

}
