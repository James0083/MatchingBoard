package com.multi.service;

import org.springframework.stereotype.Service;

public interface SocialService {
	  void saveSnsLogin(String uuid, String type, String identifier, String refreshToken);

}
