package com.ict.erp.service;

import java.util.List;

import com.ict.erp.vo.LevelInfo;

public interface LevelService {
	
	public List<LevelInfo> getLevelInfoList(LevelInfo li);

	public int getLevelInsert(LevelInfo li);
	
	public int getLevelDelete(List<Integer> linum);
	
	public LevelInfo getLevelInfo(int linum);
	
	public int getLevelUpdate(LevelInfo li);
	public int getLevelUpdateN(LevelInfo li);
	
	public int getDeleteLevel(Integer linum);
	
	public int getLinum();
}
