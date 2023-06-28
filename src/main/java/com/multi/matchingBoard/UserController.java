package com.multi.matchingBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.service.GameService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class UserController {
	@Autowired
	private GameService gameService;
	
	@GetMapping(value="/mypage")
	public String mypage() {
		
		return "user/mypage";
	}
	
	@GetMapping(value="/modify")
	public String modify(Model model) {

		    // GameVO�� name ���� DB���� ��ȸ
			
		List<String> gameName = gameService.getAllGameNames();
			//�𵨿� gameName ���� �߰��Ͽ� ��� ���� 
		model.addAttribute("gameName", gameName);
		System.out.println("gameName: "+gameName);
			 
		  
		  
		
		return "user/modify";
	}
	
	
}
