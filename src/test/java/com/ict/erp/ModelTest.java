//package com.ict.erp;
//
//import static org.junit.Assert.assertEquals;
//
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.ict.erp.dao.LevelDAO;
//import com.ict.erp.service.LevelService;
//import com.ict.erp.vo.LevelInfo;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("/root-context.xml")
//public class ModelTest {
//	
//	@Autowired
//	private LevelDAO ld;
//	
//	@Autowired
//	private LevelService ls;
//
//	@Test
//	public void DAOTest() {
//		List<LevelInfo> liList = ld.selectLevelInfoList(null);
//		assertEquals(7, liList.size());
//	}
//	
//	@Test
//	public void ServiceTest() {
//		List<LevelInfo> liList = ls.getLevelInfoList(null);
//		assertEquals(7, liList.size());
//	}
//
//}
