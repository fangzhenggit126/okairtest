package com.shangwu.po;

import java.util.List;

public class TableInfo <T> {
	 //数据库总行数
	private int total;
	//每页所显示的记录数pageSize
	private int limit;
	//当前页数pageNumber
	private int offset;
	  //当前页的数据
	private List<T> data;
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public List<T> getData() {
		return data;
	}
	public void setData(List<T> data) {
		this.data = data;
	}
	
}
