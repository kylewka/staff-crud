package com.funs.dao;

import com.funs.domain.User;

public interface UserMapper {
	
	//根据用户名查询密码
	String getPassword(String username);

	int addUser(User user);
}
