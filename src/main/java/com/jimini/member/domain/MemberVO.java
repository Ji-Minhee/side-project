package com.jimini.member.domain;

import java.util.List;

import com.jimini.role.domain.RoleVO;

import lombok.Data;

@Data
public class MemberVO {

	private Long id;
	private String mbUserId;
	private String mbPw;
	private String mbName;
	private String mbCellphone;
	private String mbEmail;
	private String mbBirth;
	private String active;
	private String regDate;
	private String updateDate;
	
	private List<RoleVO> roles;
	
}
