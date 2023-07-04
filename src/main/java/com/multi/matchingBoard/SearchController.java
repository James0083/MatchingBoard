package com.multi.matchingBoard;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.model.PageMakerVO;
import com.multi.model.PagingVO;
import com.multi.service.BoardSearchService;


@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Inject
	private BoardSearchService bservice;
	
	@GetMapping(value="/boardSearch")
	public String boardSearch(Model model, PagingVO pagingvo) {
		
		 model.addAttribute("list", bservice.getListPaging(pagingvo));
		 
		 int total = bservice.getTotal(pagingvo);
		 PageMakerVO pageMake = new PageMakerVO(pagingvo, total);
		 model.addAttribute("pageMaker", pageMake);
		
		return "search/boardSearch";
	}

}
