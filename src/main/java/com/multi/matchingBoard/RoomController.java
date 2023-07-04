package com.multi.matchingBoard;

import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.model.RoomVO;
import com.multi.model.UserVO;
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
		String url="/matchingBoard/room/roomView?roomId="+uid;
		String loc=(n>0)? url:"javascript:history.back()";
		//결과 메시지, 이동경로 처리
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "message";
//		return "matchingRoom/roomView";
	}
	
	@GetMapping(value="/roomView/{roomId}")
	public String roomDetail(Model m, @PathVariable("roomId") String roomId, HttpSession session) {
	//public String roomDetail(Model m, @RequestParam(defaultValue="0") String roomId, HttpSession session) {
		
		if(roomId.equals("0")) roomId="22f00439-08fc-4b0f-b842-a40e22c9c4ee";
		log.info("roomId: "+roomId);
		
		//방id로 해당 방 내용 가져오기
		RoomVO vo=this.rService.selectRoomByIdx(roomId);
		//test data
		UserVO u1=new UserVO();
		u1.setUserid("1111");
		u1.setNickname("micol");
		UserVO u2=new UserVO();
		u2.setUserid("2222");
		u2.setNickname("cyon");
		//해당 방의 인원 내용 가져오기
		List<UserVO> memberArr=Arrays.asList(u1, u2); //this.rService.selectMemberAll(roomId);
		
		m.addAttribute("room", vo);
		session.setAttribute("memberArr",memberArr);
//		m.addAttribute("curPnum", memberArr.size());
		
		return "matchingRoom/roomView";
	}
	
	@GetMapping(value ="/popupCalendar")
	public String popupCalendar(Model m, String rdatetime) {
		
		m.addAttribute("rstart", rdatetime);
		
		return "matchingRoom/calendarPopup";
	}
	
	@GetMapping(value="/editRoom")
	public String showeditRoomFrom(Model m, String roomId) {
		
		return "matchingRoom/editRoomForm";
	}
	
}
