package com.ict.erp.dao;

import java.util.List;

import com.ict.erp.vo.LevelInfo;

public interface LevelDAO {
	
	public List<LevelInfo> selectLevelInfoList(LevelInfo li);
	
	public int insertLevelInfo(LevelInfo li);
	
	public int deleteLevelInfo(List<Integer> linum);
	
	public LevelInfo viewLevelInfo(int linum);
	
	public int updateLevelInfo(LevelInfo li);
	

}
