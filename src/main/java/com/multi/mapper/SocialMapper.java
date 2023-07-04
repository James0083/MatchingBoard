package com.multi.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.multi.model.SnsLoginVO;

public interface SocialMapper {
	
    void insertSnsLogin(@Param("uuid") String uuid, @Param("type") String type, @Param("identifier") String identifier, @Param("refreshToken") String refreshToken);
	

}
