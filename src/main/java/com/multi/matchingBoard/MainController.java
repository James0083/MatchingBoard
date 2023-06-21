package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.model.RoomVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/room")
@Log4j
public class MainController {

	@GetMapping(value="/createRoom")
	public String createRoom() {
		
		return "matchingRoom/createRoom";
	}
	
	@PostMapping(value="/createRoom")
	public String croomResult(Model model, @ModelAttribute RoomVO room) {
		
//		System.out.println(room.toString());
		log.info("room=="+room);
		
		
		return "matchingRoom/roomView";
	}
	
	@GetMapping(value="/roomView")
	public String roomDetail(Model m, @RequestParam(defaultValue="0") int roomId) {
		//방번호로 해당 방 내용 가져오기
//		RoomVO vo=this.roomService.selectBoardByIdx(roomId);
		
		//해당 방의 인원 내용 가져오기
//		List<UserVO> memberArr=this.RoomService.selectMemberAll(roomId);
		
//		m.addAttribute("room", vo);
//		m.addAttribute("memberArr",memberArr);
		
		
		return "matchingRoom/roomView";
	}
	
}
