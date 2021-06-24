package com.jimini.board.domain;

import lombok.Data;

@Data
public class PostSearchVO {

	private Long pno;
	private String title;
	private String writer;
	private String content;
	private String regDate;
	private String updateDate;
	
}
