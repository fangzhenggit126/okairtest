package com.shangwu.service;

import java.util.List;

import com.shangwu.common.utils.Page;
import com.shangwu.po.Assets_car;

public interface Assets_carService {

	public Page<Assets_car> findAssets_carList(Integer page, Integer rows, 
	                                        String nameCn,String assetsCode,
	                                        String powerType,String carModel,int autoTrans);
	public Integer selectAssets_carListCount(Assets_car assets_car);
	

	public int createAssets_car(Assets_car assets_car);

	public Assets_car getAssets_carById(String id);
	
	public int updateAssets_car(Assets_car assets_car);

	int deleteAssets_car (String id);
}
