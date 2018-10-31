package com.ict.erp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.erp.dao.LevelDAO;
import com.ict.erp.vo.LevelInfo;

@Repository
public class LevelDAOImpl implements LevelDAO{
	
	@Autowired
	private SqlSession ss;

	@Override
	public List<LevelInfo> selectLevelInfoList(LevelInfo li) {
		return ss.selectList("SQL.LEVELINFO.selectLevelInfo", li);
	}

	@Override
	public int insertLevelInfo(LevelInfo li) {

		return ss.insert("SQL.LEVELINFO.insertLevelInfo", li);
	}

	@Override
	public int deleteLevelInfo(List<Integer> linum) {
		int result = 0;
		for(int num : linum) {
			result += ss.delete("SQL.LEVELINFO.deleteLevelInfo", linum);
		}
		return result;
	}

	@Override
	public LevelInfo viewLevelInfo(int linum) {
		
		return ss.selectOne("SQL.LEVELINFO.viewLevelInfo", linum);
	}

	@Override
	public int updateLevelInfo(LevelInfo li) {

		return ss.update("SQL.LEVELINFO.updateLevelInfo", li);
	}
	
	@Override
	public int updateLevelInfoN(LevelInfo li) {
		
		return ss.update("SQL.LEVELINFO.updateLevelInfoN", li);
	}

	@Override
	public int deleteLevel(Integer linum) {
		return ss.delete("SQL.LEVELINFO.deleteLevelInfo", linum);
	}

	@Override
	public int getLinum() {
		
		return ss.selectOne("SQL.LEVELINFO.selectLinum");
	}

}
