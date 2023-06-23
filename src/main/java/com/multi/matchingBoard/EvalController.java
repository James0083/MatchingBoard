package com.multi.matchingBoard;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.model.ShopVO;
import com.multi.service.EvalCafeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/eval")
@Log4j
public class EvalController {
	@Inject
	private EvalCafeService evalCafeSerivce;

	@GetMapping(value="/cafeEval")
	public String showCafeEvalForm(Model model) {
		model.addAttribute("shopVO", new ShopVO());
		return "eval/cafeEval";
	}
	
	@PostMapping("/cafeEval")
	public String submitCafeEvalForm(Model m, @ModelAttribute ShopVO shopVO, @RequestParam("rating") int avgRating) {
		shopVO.setStars(avgRating);
		
		int n=evalCafeSerivce.updateStars(shopVO);
		String msg="보드게임카페 평가"; 
		msg+=(n>0)?"성공":"실패";
		String loc=(n>0)?"/matchingBoard":null;
		//결과 메시지, 이동경로 처리
		m.addAttribute("msg",msg);
		m.addAttribute("loc",loc);
		return "message";
	}
}
