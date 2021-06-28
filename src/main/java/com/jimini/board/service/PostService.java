package com.jimini.board.service;

import com.jimini.board.domain.PostResponseVO;
import com.jimini.board.domain.PostVO;
import com.jimini.board.domain.ViewCountVO;
import com.jimini.common.domain.PaginationVO;

public interface PostService {

	/* 게시물 리스트 */
	public PostResponseVO getPostList(PaginationVO vo);
	
	/* 총 게시물 수 */
	public int postTotalCount();
	
	/* 게시물 상세보기 */
	public PostResponseVO getPostDetail(PostVO vo);
	
	/* 게시물 작성 */
	public void createPost(PostVO vo);
	
	/* 게시물 수정 */
	public void updatePost(PostVO vo);
	
	
	
	
	
	
	
	/* 조회수 보기 */
	public int getViewCount(ViewCountVO targetUrl);
	
	/* 조회수 증가 */
	public void plusCount(String targetUrl);
	
	
}
