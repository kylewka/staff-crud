package com.funs.dao;

import com.funs.domain.User;

public interface UserMapper {
	
	//�����û�����ѯ����
	String getPassword(String username);

	int addUser(User user);
}
