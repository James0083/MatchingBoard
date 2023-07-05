package com.multi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multi.mapper.RoomMapper;
import com.multi.model.RoomPeopleVO;
import com.multi.model.RoomVO;
import com.multi.model.UserVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Inject
	private RoomMapper rMapper;
	
	@Override
	public int insertRoom(RoomVO vo) {
//		System.out.println(vo.toString());
		return rMapper.insertRoom(vo);
	}

	@Override
	public RoomVO selectRoomByIdx(String roomid) {

		return rMapper.selectRoomByIdx(roomid);
	}

	@Override
	public int updateRoom(RoomVO vo) {

		return rMapper.updateRoom(vo);
	}

	//*****수정확인 필요*****
	@Override
	public List<UserVO> selectMemberAll(String roomid) {
	
		return rMapper.selectMemberAll(roomid);
	}
}
