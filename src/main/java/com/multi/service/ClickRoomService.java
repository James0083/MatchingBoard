package com.multi.service;

import java.util.List;

import com.multi.model.RoomVO;

public interface ClickRoomService {
	
	public RoomVO clickRoom(String roomid);
	
	public List<RoomVO> clickList();
}
