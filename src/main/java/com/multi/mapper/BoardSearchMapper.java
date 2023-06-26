package com.multi.mapper;

import java.util.List;

import com.multi.model.RoomVO;

public interface BoardSearchMapper {
	
	//모임방 목록 - SELECT 결과의 행에 대한 정보를 List 타입으로 반환
	public List<RoomVO> getList();
}
