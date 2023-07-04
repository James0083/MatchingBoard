package com.multi.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
@Repository
public interface GameMapper {
	 List<String> getAllGameNames();
}
