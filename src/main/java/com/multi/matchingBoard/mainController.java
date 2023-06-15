package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.multi.model.RoomVO;

import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/room")
@Log4j
public class mainController {

	@GetMapping(value="/createRoom")
	public String createRoom() {
		
		return "matchingRoom/createRoom";
	}
	
	@PostMapping(value="/createRoom")
	public String croomResult(Model model, @ModelAttribute RoomVO room) {
		
//		System.out.println(room.toString());
		log.info("room=="+room);
		
		
		return "matchingRoom/roomDetail";
	}
	
}
