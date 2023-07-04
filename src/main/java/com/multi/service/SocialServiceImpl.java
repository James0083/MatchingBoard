package com.multi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.mapper.SocialMapper;

@Service
public class SocialServiceImpl implements SocialService {
	@Autowired
	private SocialMapper socialmapper;
	
	@Override
	public void saveSnsLogin(String uuid, String type, String identifier, String refreshToken) {
		socialmapper.insertSnsLogin(uuid, type, identifier, refreshToken);

	}

}
