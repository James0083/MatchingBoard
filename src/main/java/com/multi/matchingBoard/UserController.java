package com.multi.matchingBoard;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	@ResponseBody
	public String modifyuser(Model model, HttpSession session,@RequestParam("profile_img") MultipartFile profile_img, 
			@RequestParam("nickname")String nickname,@RequestParam("genres") List<String> genres,@RequestParam("games") List<String> games 
			,@RequestParam("dong_code") String dongCode,@RequestParam("lee_code") String leeCode ) {
		log.info(genres);
		log.info(games);
		
		boolean isSuccess = userService.modifyUser(profile_img, nickname, genres, games, dongCode, leeCode);
        
        String message = isSuccess ? "success" : "fail";
        // String location = isSuccess ? "/matchingBoard": "javascript:history.back()";
        // model.addAttribute("msg",message);
        // model.addAttribute("loc",location);
        
        
        return message; // 변경된 응답 반환
	}
	
}

