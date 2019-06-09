package com.shangwu.service.impl;

import java.util.List;

import com.shangwu.dao.UserDao;
import com.shangwu.dao.impl.UserDaoImpl;
import com.shangwu.po.User;
import com.shangwu.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao=new UserDaoImpl();
	@Override
	public User findUser(String uid, String password) {
		// TODO Auto-generated method stub
		return userDao.findUser(uid, password);
	}

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return userDao.getUsers();
	}

}
