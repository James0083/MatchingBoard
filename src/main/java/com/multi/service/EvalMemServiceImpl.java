package com.multi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multi.mapper.EvalMemMapper;
import com.multi.model.UserVO;

@Service("evalMemService")
public class EvalMemServiceImpl implements EvalMemService {
	@Inject
	private EvalMemMapper evalMemMapper;
	
	
	@Override
	public List<UserVO> listUser() {
		return null;
	}

	@Override
	public int updateManners(UserVO user) {
		return evalMemMapper.updateManners(user);
	}

}
