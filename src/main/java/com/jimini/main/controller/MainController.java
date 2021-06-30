package com.jimini.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/")
public class MainController {

	/* 메인 페이지 */
	/*
	 * @GetMapping("/home") 
	 * public String mainHome(Model model) throws Exception {
	 * 
	 * model.addAttribute("posts", "mainHome");
	 * 
	 * ViewCountVO targetUrl = new ViewCountVO();
	 * targetUrl.setTargetUrl("/web/home"); 
	 * model.addAttribute("count", postService.getViewCount(targetUrl));
	 * 
	 * String hitUrl = "/web/home";
	 * postService.plusCount(hitUrl);
	 * 
	 * return "baseMain"; }
	 */
	
	@GetMapping
	public String mainhome() {
		
		return "zMain";
	}
	
	
}
