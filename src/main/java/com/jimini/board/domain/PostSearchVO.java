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
	
	private int pageNo;
	private int pageSize = 10;
	
	public int getStartNo() {
		if (pageNo < 1) {
			return 0;
		}
		return (pageNo - 1) * pageSize;
	}
	
}
