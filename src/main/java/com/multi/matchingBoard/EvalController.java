package com.multi.matchingBoard;


import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.model.EvaluationVO;
import com.multi.model.ShopVO;
import com.multi.service.EvalCafeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/eval")
@Log4j
public class EvalController {
	@Inject
	private EvalCafeService evalCafeService;

	@GetMapping(value = "/cafeEval")
	public String showCafeEvalForm() {
		return "eval/cafeEval";
	}

	//roomview에서 rname가져오기
	/*
	 * @GetMapping(value = "/cafeEval") 
	 * public String showCafeEvalForm(Model model, @ModelAttribute RoomVO room) { 
	 * String roomid=UUID.randomUUID().toString(); 
	 * String rname = evalCafeService.getRname(roomid); 
	 * model.addAttribute("rname", rname); 
	 * return "eval/cafeEval"; 
	 * }
	 */
	
    @PostMapping("/cafeEval")
    public String submitCafeEvalForm(Model model, @ModelAttribute ShopVO shopVO) {
			//@RequestParam(value = "mode", required = false) String mode) {
        //System.out.println("shoVO: "+shopVO);
    	
        //int n = 0;
        //String msg = "";
        //String loc="";
        
        //if(mode == null) {
        	int n=evalCafeService.insertStars(shopVO);
        	String msg = "보드게임카페 평가";
        	EvaluationVO star=evalCafeService.cafeStars(shopVO);
        	System.out.println("매장 평점: "+star.getStars());
        	//loc = (n > 0) ? "/matchingBoard/room/roomView" : "javascript:history.back()";
        	String loc = (n > 0) ? "/matchingBoard/eval/memberEval" : "javascript:history.back()";
        //}else if("memEval".equals(mode)) {
        	//msg="모임원 평가";
        	//loc = (n > 0) ? "/matchingBoard/eval/memberEval" : "javascript:history.back()";
        	//EvaluationVO star=evalCafeService.cafeStars(shopVO);
        	//System.out.println("매장 평점: "+star.getStars());
        //}
        
        msg += (n > 0) ? "성공" : "실패";
        log.info("평가 결과: " + msg);

        model.addAttribute("msg", msg);
        model.addAttribute("loc", loc);
        model.addAttribute("averageRating", shopVO.getStars());

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
