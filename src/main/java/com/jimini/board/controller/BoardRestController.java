package com.jimini.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jimini.board.domain.PostResponseVO;
import com.jimini.board.domain.PostVO;
import com.jimini.board.domain.ViewCountVO;
import com.jimini.board.service.PostService;

@RestController
@RequestMapping(value = "/rest")
public class BoardRestController {

	@Autowired
	private PostService postService;
	

	/* 게시물 전체 리스트 조회 */
	@GetMapping(value = "/post/list")
	public PostResponseVO getPostList () {
		
		PostResponseVO resVO = postService.getPostList();
		
		return resVO;
	}
	
	/* 게시물 상세조회 */
	@GetMapping(value = "/post/detail/{postId}")
	public PostResponseVO getPostDetail ( @PathVariable("postId") Long pno ) {
		
		PostVO vo = new PostVO();
		vo.setPno(pno);
		
		PostResponseVO resVO = postService.getPostDetail(vo);
		
		return resVO;
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
