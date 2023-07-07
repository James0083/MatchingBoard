package com.multi.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.multi.model.UserVO;

public interface UserService {
	void insertUser(String uuid);

	boolean modifyUser(String userid,MultipartFile profile_img, String nickname, List<String> genres, List<String> games,
			String dongCode, String leeCode);
	
	/*boolean updateUser(MultipartFile profile_img, String nickname, List<String> genres, List<String> games,
			String dongCode, String leeCode);*/
	UserVO getUserById(String userid);
}
