package com.multi.service;

import com.multi.model.RoomVO;

public interface RoomService {

	int insertRoom(RoomVO vo);
	RoomVO selectRoomByIdx(String roomid);
	int updateRoom(RoomVO vo);
	int deleteRoom(String roomid);
}
