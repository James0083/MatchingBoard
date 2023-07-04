package com.multi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.mapper.GameMapper;

@Service
public class GameServiceImpl implements GameService {
	
	private GameMapper gameMapper;
	
	@Autowired
	public GameServiceImpl(GameMapper gameMapper) {
        this.gameMapper = gameMapper;
    }
	
	@Override
	public List<String> getAllGameNames() {
		// TODO Auto-generated method stub
		return gameMapper.getAllGameNames();
	}

}
