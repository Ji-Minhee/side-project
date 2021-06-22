package com.jimini.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jimini.board.domain.ViewCountVO;
import com.jimini.board.service.PostService;

@RestController
@RequestMapping(value = "/rest")
public class BoardRestController {

	@Autowired
	private PostService postService;
	
	
	@GetMapping(value = "/count")
	public int getViewCount (ViewCountVO cvo) {
		String hitUrl = "/web/home";
		return postService.getViewCount(hitUrl);
	}
	
}
