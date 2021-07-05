package com.jimini.cmmncd.domain;

import lombok.Data;

@Data
public class GroupCodeVO {

	private int id;
	private String groupCode;
	private String groupCodeName;
	private String description;
	private String useYn;
	private String regDate;
	private String updateDate;
	
}
