package com.oracle.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.dao.UserDao;
import com.oracle.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	@Transactional
	public void save(User user) {
		userDao.save(user);
	}

	@Override
	@Transactional(readOnly=true)
	public User login(User user) {
		return userDao.getUser(user);
	}

	@Override
	@Transactional
	public void update(User user) {
		this.userDao.update(user);
	}

	@Override
	@Transactional
	public void updatePassword(User user) {
		this.userDao.updatePassword(user);
	}

}
