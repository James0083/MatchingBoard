package com.multi.service;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.multi.mapper.UserMapper;
import com.multi.model.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private ServletContext servletContext;
	
	private UserMapper userMapper;
	
	@Autowired
	public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

	@Override
	public boolean modifyUser(MultipartFile profile_img, String nickname, List<String> genres, List<String> games,
			String dongCode, String leeCode) {
		UserVO user = new UserVO();
		if (!profile_img.isEmpty()) {
            String uploadDirectory = servletContext.getRealPath("/resources/profileimg_upload");
            File directory = new File(uploadDirectory);
            if (!directory.exists()) {
                directory.mkdirs();
            }
            UUID uid = UUID.randomUUID();
            String fname = uid.toString() + profile_img.getOriginalFilename();
            user.setProfile_img(fname);
            try {
            	profile_img.transferTo(new File(uploadDirectory, fname));
            } catch (IOException e) {
                e.printStackTrace();
                return false; // 파일 업로드 실패
            }
        }
        
        // 닉네임 설정
        user.setNickname(nickname);
        
        // 지역 코드 설정
        String area = (!"선택".equals(leeCode)) ? leeCode : dongCode;
        int area_code = Integer.parseInt(area);
        user.setArea_code(area_code);

        // 장르 및 게임 설정
        for (int i = 0; i < 3; i++) {
            if (i < genres.size()) {
                String genre = genres.get(i);
                switch (i) {
                    case 0:
                        user.setFgenre1(genre);
                        break;
                    case 1:
                        user.setFgenre2(genre);
                        break;
                    case 2:
                        user.setFgenre3(genre);
                        break;
                }
            }
            if (i < games.size()) {
                String game = games.get(i);
                switch (i) {
                    case 0:
                        user.setFgame1(game);
                        break;
                    case 1:
                        user.setFgame2(game);
                        break;
                    case 2:
                        user.setFgame3(game);
                        break;
                }
            }
        }

        userMapper.modifyUser(user);

        return true;
	}

}
