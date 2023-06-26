package com.multi.matchingBoard;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.model.UserVO;
import com.multi.service.EvalMemService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/eval")
@Log4j
public class EvalMemController {
	@Inject
	private EvalMemService evalMemService;
	
	@GetMapping(value="/memberEval")
	public String showMemEvalForm(Model m) {
		Map<String, String> qMap=new HashMap<>();
		qMap.put("질문1", "해당 모임원이 시간약속은 잘 지켰나요");
		qMap.put("질문2", "해당 모임원의 게임플레이 매너는 어떠했나요");
		qMap.put("질문3", "해당 모임원의 모임참여 매너는 어떠했나요");
		m.addAttribute("question", qMap);
		return "eval/memberEval";
	}
	
	@PostMapping("/memberEval")
	public String submitMemEvalForm(Model m, @ModelAttribute UserVO userVO, @RequestParam("ratings") int avgRatings) {
		userVO.setManner(avgRatings);
		int n=evalMemService.updateManners(userVO);
		String msg="참여 인원 평가";
		msg+=(n>0)?"성공":"실패";
		String loc=(n>0)?"/matchingBoard":null;
		//결과 메시지, 이동경로 처리
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "message";
	}
}
