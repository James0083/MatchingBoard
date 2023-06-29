package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChattingController {

	@GetMapping("/chatting")
	public String ChattingTestView(Model m) {
		
//		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		m.addAttribute("userid", user.getUsername());
//		
//		log.info("==================================");
//		log.info("@ChatController, GET Chat / Username : " + user.getUsername());
		
		m.addAttribute("userid", "테스트 유저1");
		
		return "/matchingRoom/chattingTest";
	}
	
	@GetMapping("/chat")
	public String TestChat() {
		
		return "/matchingRoom/chat";
	}
	
}
