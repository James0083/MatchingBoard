package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.model.ShopVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/eval")
@Log4j
public class EvalController {

	@GetMapping(value="/cafeEval")
	public String showCafeEvalForm(Model model) {
		model.addAttribute("shopVO", new ShopVO());
		return "eval/cafeEval";
	}
	
	@PostMapping("/cafeEval")
	public String submitCafeEvalForm(ShopVO shopVO, @RequestParam("rating") double rating, RedirectAttributes redirectAttributes) {
		shopVO.setStars(rating);
		redirectAttributes.addFlashAttribute("message", "평가에 참여해주셔서 감사합니다.");
		return "redirect:/";
	}
}
