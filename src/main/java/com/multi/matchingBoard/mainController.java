package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class mainController {

	@GetMapping(value="/createRoom")
	public String createRoom() {
		
		//attribute 설정
		//jsp ${dateString }
		//html input-date value="2023-06-13" min="2023-06-13" 
		// input-time value="13:34"
		return "createRoom";
	}
	
}
