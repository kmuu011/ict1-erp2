package com.ict.erp.controller.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.erp.vo.TestInfo;

@Repository
public class TestDAOImpl {
	
	@Autowired
	private SqlSession ss;
	
	public List<TestInfo> selectTIList(TestInfo ti) {
		return ss.selectList("SQL.TESTINFO.selectTIList",ti);
	}
	
	
	public TestInfo selectTI(Integer tid) {
		return ss.selectOne("SQL.TESTINFO.selectTI", tid);
	}
	
	public Integer insertTI(TestInfo ti) {
		return ss.insert("SQL.TESTINFO.insertTI", ti);
	}
	
	public Integer updateTI(TestInfo ti) {
		return ss.update("SQL.TESTINFO.updateTI", ti);
	}
	

}
