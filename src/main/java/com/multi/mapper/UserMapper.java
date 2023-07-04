package com.multi.mapper;

import org.apache.ibatis.annotations.Param;

import com.multi.model.UserVO;

public interface UserMapper {
	int modifyUser(UserVO user);
}	
