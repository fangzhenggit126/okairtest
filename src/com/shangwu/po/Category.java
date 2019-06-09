package com.shangwu.po;

public class Category {
	private int id;
	private String code;
	private int parentId;
	private String nameCn;
	private String comment;
	private String parentCn;
	public String getParentCn() {
		return parentCn;
	}
	public void setParentCn(String parentCn) {
		this.parentCn = parentCn;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getNameCn() {
		return nameCn;
	}
	public void setNameCn(String nameCn) {
		this.nameCn = nameCn;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
}
