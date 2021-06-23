package com.jimini.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimini.board.domain.ViewCountVO;
import com.jimini.board.service.PostService;

@Controller
@RequestMapping(value = "/web")
public class BoardWebController {

	@Autowired
	private PostService postService;
	
	
	/* 메인 페이지 */
	@GetMapping("/home")
	public String mainHome(Model model) throws Exception {
		
		model.addAttribute("posts", "mainHome");
		
		ViewCountVO targetUrl = new ViewCountVO();
		targetUrl.setTargetUrl("/web/home");
		model.addAttribute("count", postService.getViewCount(targetUrl));
		
		String hitUrl = "/web/home";
		postService.plusCount(hitUrl);
		
		return "layout/baseMain";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/* 게시물 전체보기 */
	@GetMapping("/list/{boardType}")
	public String postList() {
		return "postList.html";
	}
	
	/* 게시물 상세보기 */
	@GetMapping("/detail/{postId}")
	public String postDetail() {
		return "postDetail.html";
	}
	
	/* 게시물 생성 */
	@GetMapping("/create/post")
	public String postCreate() {
		return "postCreate.html";
	}
	
	/* 게시물 수정 */
	@GetMapping("/update/post")
	public String postUpdate() {
		return "postUpdate.html";
	}
	
	/*게시물 삭제*/
	@GetMapping("/delete/post")
	public String postDelete() {
		return "postDelete.html";
	}
	
	@GetMapping("/create/{boardType}")
	public String boardCreate() {
		return "";
	}
	
	@GetMapping("/update/{boardType}")
	public String boardUpdate() {
		return "";
	}
	
	@GetMapping("/delete/{boardType}")
	public String boardDelete() {
		return "";
	}
	
	
	
	
	
	

}