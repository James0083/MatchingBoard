package com.multi.service;

import com.multi.model.EvaluationVO;
import com.multi.model.ShopVO;

public interface EvalCafeService {
	//List<ShopVO> listShop();
	//int updateStars(ShopVO shopVO);//별점 가져오기
	//int updateReviews(ShopVO shopVO);//rating 횟수 증가하기
	int insertStars(ShopVO shopVO);
	EvaluationVO cafeStars(ShopVO shopVO);
	
	//String getRname(String roomid);//RoomVO에서 rname가져오기
}
