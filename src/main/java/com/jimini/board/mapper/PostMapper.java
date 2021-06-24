package com.jimini.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jimini.board.domain.PostVO;

@Mapper
public interface PostMapper {

	/* 전체 게시물 리스트 */
	public List<PostVO> selectPostList();
	
	/* 게시물 상세조회 */
	public List<PostVO> selectPostDetail(PostVO vo);
	
	/* 게시물 작성 */
	public void createPost(PostVO vo);
	
	/* 게시물 수정 */
	public void updatePost(PostVO vo);
	
}
