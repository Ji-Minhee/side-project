package com.jimini.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.jimini.board.service.PostService;

@RestController
public class PostController {

	@Autowired
	PostService postService;
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@GetMapping("/sample1")
//	public void sample1(Model model) {
//		
//		model.addAttribute("greeting", "hello~~~~");
//		model.addAttribute("greeting2", "아아아");
//		
//	}
//	
//	@GetMapping("/sample2")
//	public void sample2(Model model) {
//		
//		MemberVO vo = new MemberVO(123, "u01", "p01", "jimini", new Timestamp(System.currentTimeMillis()));
//		
//		model.addAttribute("vo", vo);
//		
//	}
	
}
