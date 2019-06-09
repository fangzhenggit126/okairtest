package com.shangwu.dao;

import java.util.List;

import com.shangwu.po.Dictvalue;


public interface DictvalueDao {
	// 根据类别代码查询数据字典
    public List<Dictvalue> selectDictvalueByTypeCode(String typecode);
}
