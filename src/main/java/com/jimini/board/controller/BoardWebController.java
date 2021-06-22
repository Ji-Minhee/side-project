package com.jimini.board.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimini.board.domain.MemberVO;
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
		model.addAttribute("count", postService.getViewCount("/web/home"));
		
		String hitUrl = "/web/home";
		postService.plusCount(hitUrl);
		
		return "index";
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
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/sample1")
	public void sample1(Model model) {
		
		model.addAttribute("greeting", "hello~~~~");
		model.addAttribute("greeting2", "아아아");
		
	}
	
	@GetMapping("/sample2")
	public void sample2(Model model) {
		
		MemberVO vo = new MemberVO(123, "u01", "p01", "jimini", new Timestamp(System.currentTimeMillis()));
		
		model.addAttribute("vo", vo);
		
	}

}