//package com.ict.erp;
//
//import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertNotNull;
//
//import java.util.List;
//
//import javax.sql.DataSource;
//
//import org.apache.ibatis.session.SqlSession;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.ict.erp.vo.LevelInfo;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("/root-context.xml")
//public class JunitTestcase {
//	
//	@Autowired
//	@Qualifier("dataSourceProxy")
//	private DataSource ds;
//	
//	@Autowired
//	private SqlSession ss;
//	
//	@Test
//	public void ssTest() {
//		assertNotNull(ss.getConnection());
//		List<LevelInfo> liList = ss.selectList("SQL.LEVELINFO.selectLevelInfo");
//		assertEquals(9, liList.size());
//	}
//
//}