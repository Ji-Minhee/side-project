package com.jimini.board.domain;

import lombok.Data;

@Data
public class PostVO {

	private Long pno;
	private String title;
	private String writer;
	private String content;
	private Long viewCount;
	private String regDate;
	private String updateDate;
	
}
