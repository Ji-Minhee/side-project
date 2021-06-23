package com.jimini.board.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	
	private int mno;
	private String mid;
	private String mpw;
	private String mname;
	private Timestamp regdate;
	
}
