package com.shangwu.dao;

import java.util.List;

import com.shangwu.po.User;

public interface UserDao {
	/**
	 * ͨ���˺ź������ѯ�û�
	 */
	public User findUser(String uid,String password);
	public List<User> getUsers();
}
