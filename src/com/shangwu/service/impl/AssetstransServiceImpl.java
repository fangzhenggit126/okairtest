package com.shangwu.service.impl;

import java.util.List;

import com.shangwu.dao.AssetstransDao;
import com.shangwu.dao.impl.AssetstransDaoImpl;
import com.shangwu.po.Assetstrans;
import com.shangwu.service.AssetstransService;

public class AssetstransServiceImpl implements AssetstransService {
	AssetstransDao assetstransDao=new AssetstransDaoImpl();
	@Override
	public List<Assetstrans> selectAssets_carList(String asetsId) {
		// TODO Auto-generated method stub
		return assetstransDao.selectAssets_carList(asetsId);
	}

	@Override
	public int inputAssetstrans(Assetstrans assetstrans) {
		// TODO Auto-generated method stub
		return assetstransDao.inputAssetstrans(assetstrans);
	}

	@Override
	public List<Assetstrans> selectAssetstransPage(int pageNumber, int pageSize, String asetsId) {
		// TODO Auto-generated method stub
		return assetstransDao.selectAssetstransPage(pageNumber, pageSize, asetsId);
	}

	@Override
	public Integer selectAssetstransCount(String asetsId) {
		// TODO Auto-generated method stub
		return assetstransDao.selectAssetstransCount(asetsId);
	}

}
