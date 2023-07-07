package com.multi.mapper;

import com.multi.model.UserVO;

public interface UserMapper {
	void insertUser(String userid);
	
	void modifyUser(UserVO user);
	
	UserVO getUserById(String userid);
}	
