package com.jimini.member.service;

import java.util.List;

import com.jimini.member.domain.MemberVO;

public interface MemberService {

	/* 전체 회원 리스트 */
	public List<MemberVO> selectMemberList();
	
	/* 회원 정보 생성 */
	public void createMemberInfo(MemberVO vo);
	
	/* 회원 정보 수정 */
	public void updateMemberInfo();
	
	/* 회원 수 */
	public int memberTotalCount();
	
}
