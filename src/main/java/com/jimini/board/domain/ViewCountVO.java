package com.jimini.board.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ViewCountVO {
	
	private int cno;
	private String targetUrl;
	private String count;
	private String lastUpdateDate;
	
}
