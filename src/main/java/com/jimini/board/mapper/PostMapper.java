package com.jimini.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jimini.board.domain.PostVO;
import com.jimini.common.domain.PaginationVO;

@Mapper
public interface PostMapper {

	/* 전체 게시물 리스트 */
	public List<PostVO> selectPostList(PaginationVO vo);
	
	/* 게시물 상세조회 */
	public PostVO selectPostDetail(PostVO vo);
	
	/* 게시물 작성 */
	public void createPost(PostVO vo);
	
	/* 게시물 수정 */
	public void updatePost(PostVO vo);
	
	/* 게시물 삭제 */
	public void deletePost(PostVO vo);
	
	/* 총 게시물 수 */
	public int postTotalCount();
	
	/* 조회수 증가 */
	public void hitPlus(Long pno);
	
}
