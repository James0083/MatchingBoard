package com.multi.mapper;

import java.util.List;

import com.multi.model.PagingVO;
import com.multi.model.RoomVO;
import com.multi.model.WishListVO;

public interface BoardSearchMapper {
	
	//모임방 목록 - SELECT 결과의 행에 대한 정보를 List 타입으로 반환
	public List<RoomVO> getList();

	//모임방 목록(페이징 구현)
	public List<RoomVO> getListPaging(PagingVO pagingvo);
	
	//모임방 총 갯수
	public int getTotal(PagingVO paingvo);
	
	//좋아요
//	int ltlikecount(WishListVO wishlistvo);
//	int likeinsert(WishListVO wishlistvo);
//	int ltlikeinfo(WishListVO wishlistvo);
//	int likeupdate(WishListVO wishlistvo);
}
