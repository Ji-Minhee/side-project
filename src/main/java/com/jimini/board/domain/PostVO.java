package com.jimini.board.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.Data;

@Data
public class PostVO {

	private Long pno;
	private String title;
	private String writer;
	private String content;
	private Timestamp regdate;
	private Timestamp updatedate;
	
	private List<PostVO> postList;
	
}
