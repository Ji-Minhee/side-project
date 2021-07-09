package com.jimini.member.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jimini.member.domain.MemberVO;
import com.jimini.member.service.MemberService;
import com.jimini.role.domain.RoleVO;

@RestController
@RequestMapping(value = "/rest/member")
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	
	@PostMapping(value = "/join")
	public void createMemberInfo( @RequestBody MemberVO vo ) {
		
		RoleVO role = new RoleVO();
		role.setRoleName("basic");
		vo.setRoles(Arrays.asList(role));
		
		/* 스프링 시큐리티에서 지원해주는 BCryptPasswordEncoder를 이용해 회원 비밀번호를 암호화 */
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		vo.setMbPw(passwordEncoder.encode(vo.getMbPw()));
		
		memberService.createMemberInfo(vo);
	}
	
	@GetMapping(value = "/{id}")
	public MemberVO detailMemberInfo( @PathVariable("id") Long id ) {
		return memberService.selectMemberInfo(id);
	}
	
	@PostMapping(value = "/update/{id}")
	public void updateMemberInfo( @RequestBody MemberVO vo,
								  @PathVariable("id") Long id ) {
		vo.setId(id);
		memberService.updateMemberInfo(vo);
	}
	
}
