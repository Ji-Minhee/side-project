package com.jimini.cmmncd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimini.cmmncd.domain.GroupCodeVO;
import com.jimini.cmmncd.service.CommonCodeService;

@Controller
@RequestMapping(value = "/web/code")
public class CommonCodeWebController {

	@Autowired
	private CommonCodeService commonCodeService;
	
	
	@GetMapping("/group/list")
	public String groupCodeList( Model model ) {
		
		List<GroupCodeVO> groupList = commonCodeService.getGroupCodeList();
		model.addAttribute("groupList", groupList);
		
		return "commonCodeList";
	}
	
//	@GetMapping("/group/create")
//	public String groupCodeCreate() {
//		return "groupCodeWrite";
//	}
//	
//	@GetMapping("/group/update/{id}")
//	public String groupCodeUpdate( Model model,
//								   @PathVariable("id") int id ) {
//		model.addAttribute("id", id);
//		return "groupCodeUpdate";
//	}
	
	
}
