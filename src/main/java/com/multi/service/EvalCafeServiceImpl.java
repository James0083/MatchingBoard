package com.multi.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.mapper.EvalCafeMapper;
import com.multi.model.EvaluationVO;
import com.multi.model.ShopVO;

import lombok.extern.log4j.Log4j;

@Service("evalCafeService")
@Log4j
public class EvalCafeServiceImpl implements EvalCafeService {
	private final EvalCafeMapper evalCafeMapper;

	@Inject
	public EvalCafeServiceImpl(EvalCafeMapper evalCafeMapper) {
		this.evalCafeMapper = evalCafeMapper;
	}

	/*
	 * @Override
	 * 
	 * @Transactional public int updateStars(ShopVO shopVO) {
	 * log.info("평가 service 성공"); log.info("업데이트 카페이름: " + shopVO.getSname());
	 * log.info("평균 평점: " + shopVO.getStars()); int result =
	 * evalCafeMapper.updateStars(shopVO); return result; }
	 */

	/*
	 * @Override public List<ShopVO> listShop() {
	 * 
	 * return null; }
	 */

	/*
	 * @Override public int updateReviews(ShopVO shopVO) { return
	 * evalCafeMapper.updateReviews(shopVO); }
	 */

	@Override
	public int insertStars(ShopVO shopVO) {
		return evalCafeMapper.insertStars(shopVO);
	}

	@Override
	public EvaluationVO cafeStars(ShopVO shopVO) {
		return evalCafeMapper.cafeStars(shopVO);
	}
	 
	/*
	 * @Override 
	 * public String getRname(String roomid) { 
	 * return evalCafeMapper.getRname(roomid); }
	 */
}
