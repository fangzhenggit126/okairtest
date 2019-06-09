package com.shangwu.service;

import java.util.List;

import com.shangwu.po.Category;

public interface CategoryService {
	// 根据类别代码查询数据字典
    public List<Category> selectCategoryByParentId(int ParentId);
 // 根据类别代码查询数据字典
    public List<Category> selectCategoryByPage(int pageNumber,int pageSize,String nameCn,String parentCn);
    public Integer selectCategoryCount(String nameCn,String parentCn);
}
