package com.jimini.board.domain;

import java.util.List;

import lombok.Data;

@Data
public class PostResponseVO {

	private List<PostVO> postList;
	
	private String result;

}
