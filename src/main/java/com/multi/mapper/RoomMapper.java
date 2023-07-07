package com.multi.mapper;

import java.util.List;

import com.multi.model.RoomPeopleVO;
import com.multi.model.RoomVO;
import com.multi.model.UserVO;

public interface RoomMapper {

	int insertRoom(RoomVO room);
	RoomVO selectRoomByIdx(String roomid);
	int updateRoom(RoomVO room);
	//*****수정확인 필요*****
	List<UserVO> selectMemberAll(String roomid);
	int deleteRoom(String roomid);
	
}
