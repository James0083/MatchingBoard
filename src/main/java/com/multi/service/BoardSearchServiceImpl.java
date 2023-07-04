package com.multi.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.multi.mapper.BoardSearchMapper;
import com.multi.model.PagingVO;
import com.multi.model.RoomVO;
import com.multi.model.WishListVO;

@Service
public class BoardSearchServiceImpl implements BoardSearchService{

	@Inject 
	private BoardSearchMapper mapper;
	
	//모임방 리스트
	@Override
	public List<RoomVO> getList() {
		return mapper.getList();
	}

	//모임방 리스트 (페이징)
	@Override
	public List<RoomVO> getListPaging(PagingVO pagingvo) {
		
		return mapper.getListPaging(pagingvo);
	}

	//모임방 총 갯수
	@Override
	public int getTotal(PagingVO pagingvo) {
		
		return mapper.getTotal(pagingvo);
	}

	
	
	
	
	
	/**
	@Override
	public int ltlikecount(WishListVO wishlistvo) {
		return mapper.ltlikecount(wishlistvo);
	}

	@Override
	public int likeinsert(WishListVO wishlistvo) {
		// TODO Auto-generated method stub
		return 0;
	}

*/

}
