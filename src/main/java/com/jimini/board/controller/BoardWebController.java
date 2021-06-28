package com.jimini.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jimini.board.service.PostService;
import com.jimini.common.domain.PaginationVO;

@Controller
@RequestMapping(value = "/web")
public class BoardWebController {

	
	@Autowired
	private PostService postService;
	
	
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
	
	
	/* 게시물 전체보기 */
	@GetMapping("/list")
	public String postList( Model model,
							@RequestParam(required = false, defaultValue = "1") int page,
							@RequestParam(required = false, defaultValue = "1") int range ) {
		
		//전체 게시글 개수
		int totCnt = postService.postTotalCount();
		
		//Pagination 객체 생성
		PaginationVO pagination = new PaginationVO();
		pagination.pageInfo(page, range, totCnt);
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardList", postService.getPostList(pagination));
		
		return "postList";
	}
	
	/* 게시물 상세보기 */
	@GetMapping("/detail/{postId}")
	public String postDetail( Model model, @PathVariable("postId") Long pno ) {
		model.addAttribute("pno", pno);
		return "postDetail";
	}
	
	/* 게시물 작성 */
	@GetMapping("/create")
	public String postCreate() {
		return "postWrite";
	}
	
	/* 게시물 수정 */
	@GetMapping("/update/{postId}")
	public String postUpdate( Model model, @PathVariable("postId") Long pno ) {
		model.addAttribute("pno", pno);
		return "postUpdate";
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
	
	@GetMapping("/delete/{boardType}")
	public String boardDelete() {
		return "";
	}
	
	
	
	
	
	

}