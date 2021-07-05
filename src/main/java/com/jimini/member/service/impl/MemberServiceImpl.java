package com.jimini.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimini.member.domain.MemberVO;
import com.jimini.member.mapper.MemberMapper;
import com.jimini.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	public MemberMapper memberMapper;
	
	
	@Override
	public List<MemberVO> selectMemberList() {
		return memberMapper.selectMemberList();
	}
	
	@Override
	public void createMemberInfo(MemberVO vo) {
		memberMapper.createMemberInfo(vo);
	}
	
	@Override
	public void updateMemberInfo() {
		memberMapper.updateMemberInfo();
	}
	
	@Override
	public int memberTotalCount() {
		return memberMapper.memberTotalCount();
	}
	
}
