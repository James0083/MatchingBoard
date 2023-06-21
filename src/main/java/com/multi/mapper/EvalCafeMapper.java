package com.multi.mapper;

import java.util.List;

import com.multi.model.ShopVO;

public interface EvalCafeMapper {
	List<ShopVO> listShop();
	double updatestars(ShopVO shop);
}
