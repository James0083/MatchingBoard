package com.multi.mapper;

import java.util.List;

import com.multi.model.UserVO;

public interface EvalMemMapper {
	List<UserVO> listUser();
	int updateManners(UserVO user);
}
