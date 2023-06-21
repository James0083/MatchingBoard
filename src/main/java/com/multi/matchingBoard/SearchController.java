package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/search")
public class SearchController {
	
	@GetMapping(value="/boardSearch")
	public String boardSearch() {
		
		return "search/boardSearch";
	}

}
