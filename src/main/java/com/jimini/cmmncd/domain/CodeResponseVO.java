package com.jimini.cmmncd.domain;

import java.util.List;

import lombok.Data;

@Data
public class CodeResponseVO {

	private List<DetailCodeVO> detailCodeList;
	
	private int totCnt;
	
}
