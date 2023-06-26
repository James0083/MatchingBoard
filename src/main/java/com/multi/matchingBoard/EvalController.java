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

	@GetMapping(value = "/cafeEval")
	public String showCafeEvalForm() {
		return "eval/cafeEval";
	}

    @PostMapping("/cafeEval")
    public String submitCafeEvalForm(Model model, @ModelAttribute ShopVO shopVO,
			@RequestParam("averageRating") double averageRating,
			@RequestParam(value = "mode", required = false) String mode) {
        
    	shopVO.setStars(averageRating);

        int n = 0;
        String msg = "";
        String loc="";
        
        if(mode == null) {
        	n=evalCafeSerivce.updateStars(shopVO);
        	msg = "보드게임카페 평가";
        	loc = (n > 0) ? "/matchingBoard/room/roomView" : "javascript:history.back()";
        }else if("memEval".equals(mode)) {
        	msg="모임원 평가";
        	loc = "/matchingBoard/eval/memberEval";
        }
        
        msg += (n > 0) ? "성공" : "실패";
        log.info("평가 결과: " + msg);

        model.addAttribute("msg", msg);
        model.addAttribute("loc", loc);
        model.addAttribute("averageRating", averageRating);

        // 추가 작업: 로그와 메시지를 전달
        log.info("평가 결과: " + msg);
        model.addAttribute("logMessage", "평가 결과: " + msg);

        return "message";
    }
	/*
	 * @PostMapping("/cafeEval") public String submitCafeEvalForm(Model
	 * model, @ModelAttribute ShopVO shopVO,
	 * 
	 * @RequestParam("averageRating") double averageRating) {
	 * shopVO.setStars(averageRating);
	 * 
	 * int n = evalCafeSerivce.updateStars(shopVO);
	 * String msg = "보드게임카페 평가"; 
	 * String loc = (n>0)?"/matchingBoard/room/roomView":"javascript:history.back()"; 
	 * msg += (n > 0) ? "성공" : "실패"; log.info("평가 결과: " + msg);
	 * 
	 * model.addAttribute("msg", msg); 
	 * model.addAttribute("loc", loc);
	 * model.addAttribute("averageRating", averageRating);
	 * 
	 * // 추가 작업: 로그와 메시지를 전달 
	 * log.info("평가 결과: " + msg);
	 * model.addAttribute("logMessage", "평가 결과: " + msg);
	 * 
	 * return "message"; }
	 */
}
