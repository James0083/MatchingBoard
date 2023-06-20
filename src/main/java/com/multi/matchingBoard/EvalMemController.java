package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/eval")
@Log4j
public class EvalMemController {
	
	@GetMapping(value="/memberEval")
	public String showMemEvalForm() {
		
		return "eval/memberEval";
	}
	
}
