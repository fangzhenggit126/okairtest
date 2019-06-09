package com.shangwu.dao;

import java.util.List;

import com.shangwu.po.User;

public interface UserDao {
	/**
	 * 通过账号和密码查询用户
	 */
	public User findUser(String uid,String password);
	public List<User> getUsers();
}
