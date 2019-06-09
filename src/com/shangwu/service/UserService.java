package com.shangwu.service;

import java.util.List;

import com.shangwu.po.User;

public interface UserService {
	public User findUser(String uid,String password);
	public List<User> getUsers();
}
