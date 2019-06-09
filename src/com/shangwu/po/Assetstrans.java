package com.shangwu.po;

import java.util.Date;

public class Assetstrans {
	private String id;
	private String assetsId;
	private String batchNo;
	private String transType;
	private int count;
	private double price;
	private String handlerEmp;
	private String instockTime;
	private String targetEmp;
	private String comment;
	private String createTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAssetsId() {
		return assetsId;
	}
	public void setAssetsId(String assetsId) {
		this.assetsId = assetsId;
	}
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	public String getTransType() {
		return transType;
	}
	public void setTransType(String transType) {
		this.transType = transType;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getHandlerEmp() {
		return handlerEmp;
	}
	public void setHandlerEmp(String handlerEmp) {
		this.handlerEmp = handlerEmp;
	}
	public String getInstockTime() {
		return instockTime;
	}
	public void setInstockTime(String instockTime) {
		this.instockTime = instockTime;
	}
	public String getTargetEmp() {
		return targetEmp;
	}
	public void setTargetEmp(String targetEmp) {
		this.targetEmp = targetEmp;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
