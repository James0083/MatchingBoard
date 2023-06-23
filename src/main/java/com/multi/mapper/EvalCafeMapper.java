package com.multi.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.model.ShopVO;

@Mapper
public interface EvalCafeMapper {
	List<ShopVO> listShop();
	int updateStars(ShopVO shop);//별점 가져오기

	int updateReviews(ShopVO shop);//rating 횟수 증가하기
}
