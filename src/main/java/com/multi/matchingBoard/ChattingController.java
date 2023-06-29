package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ChattingController {

	@GetMapping("/chatting")
	public String ChattingTestView() {
		
		return "/matchingRoom/chattingTest";
	}
	
	
	
}
