package com.multi.service;

import java.util.List;

import javax.inject.Inject;

import com.multi.mapper.BoardSearchMapper;
import com.multi.model.RoomVO;

public class BoardSearchImpl implements BoardSearchService{

	@Inject 
	private BoardSearchMapper mapper;
	
	@Override
	public List<RoomVO> getList() {
		return mapper.getList();
	}
}
