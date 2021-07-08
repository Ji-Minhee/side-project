package com.jimini.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jimini.member.domain.MemberVO;
import com.jimini.member.service.MemberService;

@RestController
@RequestMapping(value = "/rest/member")
public class MemberRestController {

	@Autowired
	private MemberService memberService;
	
	
	@PostMapping(value = "/join")
	public void createMemberInfo( @RequestBody MemberVO vo ) {
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
