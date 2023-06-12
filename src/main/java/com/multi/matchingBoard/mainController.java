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
		return "createRoom";
	}
	
}
