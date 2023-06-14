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
		
		//attribute 설정
		//jsp ${dateString }
		//html input-date value="2023-06-13" min="2023-06-13" 
		// input-time value="13:34"
		return "matchingRoom/createRoom";
	}
	
	@PostMapping(value="/createRoom")
	public String croomResult(Model model, @ModelAttribute RoomVO room) {
		
//		System.out.println(room.toString());
		log.info("room=="+room);
		
		
		return "matchingRoom/roomDetail";
	}
	
}
