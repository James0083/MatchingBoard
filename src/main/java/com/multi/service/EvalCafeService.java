package com.multi.service;

import java.util.List;

import com.multi.model.ShopVO;

public interface EvalCafeService {
	List<ShopVO> listShop();
	int updateStars(ShopVO shop);//별점 가져오기

	int updateReviews(ShopVO shop);//rating 횟수 증가하기
}
