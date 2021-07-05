package com.jimini.cmmncd.domain;

import lombok.Data;

@Data
public class DetailCodeVO {

	private int id;
	private int groupId;
	private String detailCode;
	private String detailCodeName;
	private String description;
	private String useYn;
	private String regDate;
	private String updateDate;
	
	private String groupCode;
	
}
