package com.jwt.redeem.service;

import org.springframework.stereotype.Service;

import com.jwt.redeem.entities.User;

public interface UserService {
	public User findUserByEmail(String email);
	public boolean saveUser(User user);
}