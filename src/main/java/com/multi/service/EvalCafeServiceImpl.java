package com.multi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.mapper.EvalCafeMapper;
import com.multi.model.ShopVO;
@Service("evalCafeService")
public class EvalCafeServiceImpl implements EvalCafeService{
	@Autowired
	private EvalCafeMapper evalCafeMapper;

	@Override
	public List<ShopVO> listShop() {
		
		return null;
	}

	@Override
	public int updateStars(ShopVO shop) {
		return evalCafeMapper.updateStars(shop);
	}

	@Override
	public int updateReviews(ShopVO shop) {
		return evalCafeMapper.updateReviews(shop);
	}
	
}
