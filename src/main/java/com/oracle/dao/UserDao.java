package com.oracle.dao;


import com.oracle.vo.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
	
	public void save(User user);
	
	public User getUser(User user);

	public void update(User user);
	
	public void updatePassword(User user);
	
}
