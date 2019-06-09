package com.shangwu.dao;

import java.util.List;

import com.shangwu.po.Assetstrans;

public interface AssetstransDao {
	public List<Assetstrans> selectAssets_carList(String asetsId);
	public int inputAssetstrans(Assetstrans assetstrans);
	public List<Assetstrans> selectAssetstransPage(int pageNumber,int pageSize,String asetsId);
	public Integer selectAssetstransCount(String asetsId);
}
