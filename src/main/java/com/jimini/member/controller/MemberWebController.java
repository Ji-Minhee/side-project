package com.jimini.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimini.member.domain.MemberVO;
import com.jimini.member.service.MemberService;

@Controller
@RequestMapping(value = "/web/member")
public class MemberWebController {

	@Autowired
	private MemberService memberService;
	
	
	
	@GetMapping("/list")
	public String memberList( Model model ) {
		
		List<MemberVO> memberList = memberService.selectMemberList();
		model.addAttribute("memberList", memberList);
		
		return "memberList";
	}
	
	@GetMapping("/join")
	public String memberJoin() {
		return "memberJoin";
	}
	
}
