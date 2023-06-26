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
		//String loc=(n>0)?"/matchingBoard":null;

		Map<Integer, Integer> ratings = new HashMap<>();
		//ratings.put(1,3);//예시
		
		double averageRating = averageRating(ratings);
		
		m.addAttribute("msg",msg);
		//m.addAttribute("loc",loc);
		m.addAttribute("averageRating",averageRating);
		return "message";
	}
	
	//별점 계산
	private double averageRating(Map<Integer, Integer> ratings) {
	    double totalRating = 0;
	    int questionCnt = 0;

	    for(Integer rating : ratings.values()) {
	        if(rating != null) {
	            totalRating += rating;
	            questionCnt++;
	        }
	    }

	    double avgRating = questionCnt > 0 ? (totalRating / questionCnt) : 0;
	    avgRating = Math.round(avgRating * 100.0) / 100.0; // 소수점 2째 자리까지 반올림

	    return avgRating;
	}
}
