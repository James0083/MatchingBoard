package com.multi.mapper;

import com.multi.model.RoomVO;

public interface RoomMapper {

	int insertRoom(RoomVO room);
	RoomVO selectRoomByIdx(String roomid);
	int updateRoom(RoomVO room);
	int deleteRoom(String roomid);
	
}
