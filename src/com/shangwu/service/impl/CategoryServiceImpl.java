package com.shangwu.service.impl;

import java.util.List;

import com.shangwu.dao.CategoryDao;
import com.shangwu.dao.impl.CategoryDaoImpl;
import com.shangwu.po.Category;
import com.shangwu.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	CategoryDao categoryDao=new CategoryDaoImpl();
	@Override
	public List<Category> selectCategoryByParentId(int ParentId) {
		// TODO Auto-generated method stub
		return categoryDao.selectCategoryByParentId(ParentId);
	}
	@Override
	public List<Category> selectCategoryByPage(int pageNumber, int pageSize, String nameCn, String parentCn) {
		// TODO Auto-generated method stub
		return categoryDao.selectCategoryByPage(pageNumber, pageSize, nameCn, parentCn);
	}
	@Override
	public Integer selectCategoryCount(String nameCn, String parentCn) {
		// TODO Auto-generated method stub
		return categoryDao.selectCategoryCount(nameCn, parentCn);
	}

}
