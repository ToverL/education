package com.oracle.service;



import com.oracle.vo.User;

public interface UserService {
	public void save(User user);
	
	public User login(User user);

	public void update(User user);
	
	public void updatePassword(User user);
}
