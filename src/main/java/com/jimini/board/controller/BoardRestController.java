package com.jimini.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jimini.board.domain.PostResponseVO;
import com.jimini.board.domain.PostVO;
import com.jimini.board.domain.ViewCountVO;
import com.jimini.board.service.PostService;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping(value = "/rest/post")
public class BoardRestController {

	@Autowired
	private PostService postService;
	

	/* 게시물 상세조회 */
	@GetMapping(value = "/detail/{postId}")
	public PostResponseVO getPostDetail ( @PathVariable("postId") Long pno ) {
		
		PostVO vo = new PostVO();
		vo.setPno(pno);
		
		postService.hitPlus(pno);
		
		PostResponseVO resVO = postService.getPostDetail(vo);
		log.info(":::::::::::::: 게시물 상세조회");
		
		return resVO;
	}
	
	/* 게시물 등록 */
	@PostMapping(value = "/write")
	public void createPost ( @RequestBody PostVO vo ) {
		postService.createPost(vo);
		log.info(":::::::::::::: 게시물 등록 완료");
	}
	
	/* 게시물 수정 */
	@PostMapping(value = "/update/{postId}")
	public void updatePost ( @RequestBody PostVO vo,
							 @PathVariable("postId") Long pno ) {
		vo.setPno(pno);
		postService.updatePost(vo);
		log.info(":::::::::::::: 게시물 수정 완료");
	}
	
	
	
	
	
	
	
	/* 뷰 카운트 조회 */
	@GetMapping(value = "/count")
	public Object getViewCount (ViewCountVO cvo) {
		
		//String hitUrl = "/web/home";
		
		ViewCountVO targetUrl = new ViewCountVO();
		targetUrl.setTargetUrl("/web/home");
		
		return postService.getViewCount(targetUrl);
	}
	
}
