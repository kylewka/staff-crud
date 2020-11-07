package com.funs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funs.dao.UserMapper;
import com.funs.domain.User;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;
	
	public String getPassword(String username) {
		return userMapper.getPassword(username);
	}

	public void addUser(User user) {
		// TODO Auto-generated method stub
		userMapper.addUser(user);
	}
}
