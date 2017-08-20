package com.jwt.redeem.dao;

import com.jwt.redeem.entities.User;

public interface UserDao {
	public User getLoginUser(String userName);
	public boolean saveUserData(User user);
	User findUserByEmail(String email);
	User findByUsername(String username);
}
