package com.multi.matchingBoard;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.multi.common.CommonUtil;
import com.multi.model.UserVO;
import com.multi.service.GameService;
import com.multi.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class UserController {
	@Autowired
	private GameService gameService;
	@Autowired
	private UserService userService;

	
	@Autowired
	private CommonUtil util;
	
	@GetMapping(value="/mypage")
	public String mypage() {
		
		return "user/mypage";
	}
	
	@GetMapping(value="/modify")
	public String modify(Model model) {

		List<String> gameName = gameService.getAllGameNames();
			//모델에 gameName 값을 추가하여 뷰로 전달 
		model.addAttribute("gameName", gameName);
		return "user/modify";
	}
	@PostMapping(value="/submitUserInfo")
	public String modifyuser(Model model, HttpSession session,@RequestParam("profile_img") MultipartFile profile_img, 
			@RequestParam("nickname")String nickname,@RequestParam("genres") List<String> genres,@RequestParam("games") List<String> games 
			,@RequestParam("dong_code") String dongCode,@RequestParam("lee_code") String leeCode ) {
		
		boolean isSuccess = userService.modifyUser(profile_img, nickname, genres, games, dongCode, leeCode);
        
        String message = isSuccess ? "성공" : "실패";
        String location = isSuccess ? "redirect:/matchingBoard" : "javascript:history.back()";
        
        // 메시지와 로케이션을 모델에 추가하는 부분은 util.addMsgLoc(model, message, location)와 같이 처리될 수 있습니다.
        // 여기서는 단순히 반환 예시를 보여드리기 위해 메시지와 로케이션을 직접 처리했습니다.

        return location; // 변경된 응답 반환
	}
	
}

