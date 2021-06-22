package com.jimini.board.domain;

import java.sql.Timestamp;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor		// 자동으로 모든 매개변수를 받는 생성자를 생성 
public class PostVO {

	private Long pno;
	private String title;
	private String writer;
	private String content;
	private Timestamp regdate;
	private Timestamp updatedate;
	
	private List<PostVO> postList;
	
}
