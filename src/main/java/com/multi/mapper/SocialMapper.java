package com.multi.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface SocialMapper {
	@Insert("INSERT INTO Social(uuid, type, identifier, refreshtoken) VALUES(#{uuid}, #{type}, #{identifier}, #{refreshToken})")
    void insertSnsLogin(@Param("uuid") String uuid, @Param("type") String type, @Param("identifier") String identifier, @Param("refreshToken") String refreshToken);
}
