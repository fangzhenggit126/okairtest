package com.shangwu.po;

import java.util.Date;

public class User {
   private int id;
   private String uid;
   private String pwd;
   private String nickName;
   private String role;
   private Date createTime;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUid() {
	return uid;
}
public void setUid(String uid) {
	this.uid = uid;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getNickName() {
	return nickName;
}
public void setNickName(String nickName) {
	this.nickName = nickName;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
public Date getCreateTime() {
	return createTime;
}
public void setCreateTime(Date createTime) {
	this.createTime = createTime;
}
}
