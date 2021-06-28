package com.jimini.board.domain;

import java.util.List;

import com.jimini.common.domain.PaginationVO;

import lombok.Data;

@Data
public class PostResponseVO {

	private List<PostVO> postList;
	
	private PostVO post;
	
	private int totCnt;
	
	private PaginationVO pagination;
	
}
