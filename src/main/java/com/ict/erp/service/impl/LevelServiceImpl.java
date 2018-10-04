package com.ict.erp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.erp.dao.LevelDAO;
import com.ict.erp.service.LevelService;
import com.ict.erp.vo.LevelInfo;


@Service
public class LevelServiceImpl implements LevelService{
	
	@Autowired
	private LevelDAO ld;

	@Override
	public List<LevelInfo> getLevelInfoList(LevelInfo li) {
		
		return ld.selectLevelInfoList(li);
	}

	@Override
	public int getLevelInsert(LevelInfo li) {
		
		return ld.insertLevelInfo(li);
	}

	@Override
	public int getLevelDelete(List<Integer> linum) {
		return ld.deleteLevelInfo(linum);
	}

	@Override
	public LevelInfo getLevelInfo(int linum) {
		
		return ld.viewLevelInfo(linum);
	}

	@Override
	public int getLevelUpdate(LevelInfo li) {
		
		return ld.updateLevelInfo(li);
	}

}
