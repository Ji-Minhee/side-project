package com.jimini.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jimini.board.domain.PostVO;

@Mapper
public interface PostMapper {

	public List<PostVO> selectPostList(PostVO vo);
	
	public void createPost(PostVO vo);
	
	public void updatePost(PostVO vo);
	
}
