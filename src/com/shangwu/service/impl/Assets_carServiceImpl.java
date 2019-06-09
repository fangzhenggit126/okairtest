package com.shangwu.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.shangwu.common.utils.Page;
import com.shangwu.dao.Assets_carDao;
import com.shangwu.dao.impl.Assets_carDaoImpl;
import com.shangwu.po.Assets_car;
import com.shangwu.service.Assets_carService;

public class Assets_carServiceImpl implements Assets_carService {
	Assets_carDao assets_carDao=new Assets_carDaoImpl();
	@Override
	public Page<Assets_car> findAssets_carList(Integer page, Integer rows, String nameCn, String assetsCode,
			String powerType, String carModel, int autoTrans) {
	
		Assets_car assets_car = new Assets_car();
		
		if(StringUtils.isNotBlank(nameCn)){
			assets_car.setNameCn(nameCn);
		}
		
		if(StringUtils.isNotBlank(assetsCode)){
			assets_car.setAssetsCode(assetsCode);
		}
		
		if(StringUtils.isNotBlank(powerType)){
			assets_car.setPowerType(powerType);
		}
		
		if(StringUtils.isNotBlank(carModel)){
			assets_car.setCarModel(carModel);;
		}
		assets_car.setAutoTrans(autoTrans);

	
		assets_car.setStart((page-1) * rows) ;
		
		assets_car.setRows(rows);
		
		List<Assets_car> assets_cars = assets_carDao.selectAssets_carList(assets_car);
		
		Integer count = assets_carDao.selectAssets_carListCount(assets_car);
		
		Page<Assets_car> result = new Page<>();
		result.setPage(page);
		result.setRows(assets_cars);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}

	@Override
	public Integer selectAssets_carListCount(Assets_car assets_car) {
		// TODO Auto-generated method stub
		return assets_carDao.selectAssets_carListCount(assets_car);
	}

	@Override
	public int createAssets_car(Assets_car assets_car) {
		// TODO Auto-generated method stub
		return assets_carDao.createAssets_car(assets_car);
	}

	@Override
	public Assets_car getAssets_carById(String id) {
		// TODO Auto-generated method stub
		return assets_carDao.getAssets_carById(id);
	}

	@Override
	public int updateAssets_car(Assets_car assets_car) {
		// TODO Auto-generated method stub
		return assets_carDao.updateAssets_car(assets_car);
	}

	@Override
	public int deleteAssets_car(String id) {
		// TODO Auto-generated method stub
		return assets_carDao.deleteAssets_car(id);
	}

	

}
