package com.multi.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.mapper.UserMapper;
import com.multi.model.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	private UserMapper userMapper;
	
	@Autowired
	public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

	@Override
	public int modifyUser(UserVO user) {
		// TODO Auto-generated method stub
		return userMapper.modifyUser(user);
	}
	

}
