package com.multi.matchingBoard;

import java.util.UUID;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.model.RoomVO;
import com.multi.service.RoomService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/room")
@Log4j
public class RoomController {

	@Inject
	private RoomService rService;
	
	@GetMapping(value="/createRoom")
	public String createRoom() {
		
		return "matchingRoom/createRoom";
	}
	
	@PostMapping(value="/createRoom")
	public String cRoomResult(Model m, @ModelAttribute RoomVO room) {
			
		String uid=UUID.randomUUID().toString();
		room.setRoomid(uid);
		
		//////
		if(room.getRplace().isEmpty()) room.setRplace("(임시) 모임장소");
		log.info("room=="+room.toString());
		//////
		
		int n=rService.insertRoom(room);
		String msg="모임방만들기 "; 
		msg+=(n>0)?"성공":"실패";
		String loc=(n>0)?"/matchingBoard":"javascript:history.back()";
		//결과 메시지, 이동경로 처리
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "message";
//		return "matchingRoom/roomView";
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
	
	@GetMapping(value ="/popupCalendar")
	public String popupCalendar(String roomid) {
		
		return "matchingRoom/calendarPopup";
	}
	
}
