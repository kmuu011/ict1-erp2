//package com.ict.erp;
//
//import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertNotNull;
//import static org.junit.Assert.fail;
//
//import java.sql.Connection;
//import java.sql.SQLException;
//import java.util.List;
//
//import javax.sql.DataSource;
//
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import com.ict.erp.dao.LevelDAO;
//import com.ict.erp.vo.LevelInfo;
//
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("/root-context.xml")
//public class DataSourceTest {
//	
//
//	@Autowired
//	@Qualifier("dataSourceProxy")
//	private DataSource ds;
//	
//	@Autowired
//	private SqlSessionFactory ssf;
//	
//	@Autowired
//	private SqlSession ss;
//	
//	public void test() {
//		try {
//			Connection con = ds.getConnection();
//			assertNotNull(con);
//		} catch (SQLException e) {
//			fail(e.getMessage());
//		}
//	}
//	
//	public void ssfTest() {
//		try(SqlSession ss = ssf.openSession()){
//			System.out.println("Sql Session 생성 완료");
//		}catch(Exception e) {
//			fail(e.getMessage());
//		}
//	}
//	
//	@Test
//	public void ssTest() {
//		assertNotNull(ss.getConnection());
//		List<LevelInfo> liList = ss.selectList("SQL.LEVELINFO.selectLevelInfo");
//		assertEquals(9, liList.size());
//	}
//	
//	public void insertTest() {
//		for(int i=0 ; i<10 ; i++) {
//			LevelInfo li = new LevelInfo();
//			li.setLilevel(10+i+1);
//			li.setLiname("테스트0" +i);
//			li.setLidesc("테스트데이터" + i);
//			assertEquals(ss.insert("SQL.LEVELINFO.insertLevelInfo",li), 1);
//		}
//	}
//
//	
//	public void updateTest() {
//		LevelInfo li = new LevelInfo();
//		li.setLinum(85);
//		li.setLiname("테스트77");
//		li.setLidesc("테스트데이터777");
//		assertEquals(ss.update("SQL.LEVELINFO.updateLevelInfo",li), 1);
//	}
//	
//	
//	public void deleteTest() {
//		LevelInfo li = new LevelInfo();
//		li.setLinum(83);
//		assertEquals(ss.delete("SQL.LEVELINFO.deleteLevelInfo",li), 1);
//	}
//	
//	
//	@Autowired
//	private LevelDAO ld;
//	
//	public void DAOTest() {
//		
//	}
//	
//}
