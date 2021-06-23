package com.jimini.board.domain;

import lombok.Data;

@Data
public class ViewCountVO {
	
	private int cno;
	private String targetUrl;
	private String count;
	private String lastUpdateDate;
	
}
