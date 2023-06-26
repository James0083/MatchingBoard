package com.multi.mapper;

import com.multi.model.RoomVO;

public interface RoomMapper {

	int insertRoom(RoomVO room);
	RoomVO selectBoardByIdx(String roomid);
}
