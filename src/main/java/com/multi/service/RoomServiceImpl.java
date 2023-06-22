package com.multi.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multi.mapper.RoomMapper;
import com.multi.model.RoomVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Inject
	private RoomMapper rMapper;
	
	@Override
	public int insertRoom(RoomVO vo) {
		System.out.println(vo.toString());
		return rMapper.insertRoom(vo);
	}

}
