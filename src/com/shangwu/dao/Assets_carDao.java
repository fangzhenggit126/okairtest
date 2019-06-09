package com.shangwu.dao;

import java.util.List;

import com.shangwu.po.Assets_car;

public interface Assets_carDao {
	
	public List<Assets_car> selectAssets_carList(Assets_car assets_car);
	
	public Integer selectAssets_carListCount(Assets_car assets_car);
	
	public int createAssets_car(Assets_car assets_car);
	
	public Assets_car getAssets_carById(String id);
	
	public int updateAssets_car(Assets_car assets_car);
	
	int deleteAssets_car (String id);
}
