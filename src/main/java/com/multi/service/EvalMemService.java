package com.multi.service;

import java.util.List;

import com.multi.model.UserVO;

public interface EvalMemService {
	List<UserVO> listUser();
	int updateManners(UserVO user);//별점 가져오기

	//int updateReviews(ShopVO shop);//rating 횟수 증가하기
}
