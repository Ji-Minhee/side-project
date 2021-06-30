package com.jimini.cmmncd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jimini.cmmncd.domain.CodeResponseVO;
import com.jimini.cmmncd.domain.DetailCodeVO;
import com.jimini.cmmncd.domain.GroupCodeVO;
import com.jimini.cmmncd.service.CommonCodeService;

@Controller
@RequestMapping(value = "/rest/code")
public class CommonCodeRestController {

	@Autowired
	private CommonCodeService commonCodeService;
	
	
	/* 그룹코드 등록 */
	@PostMapping(value = "/group/write")
	public void createGroupCode( @RequestBody GroupCodeVO vo ) {
		commonCodeService.createGroupCode(vo);
	}
	
	/* 그룹코드 수정 */
	@PostMapping(value = "/group/update")
	public void updateGroupCode( @RequestBody GroupCodeVO vo ) {
		commonCodeService.updateGroupCode(vo);
	}
	
	
	/* 상세코드 리스트 */
	@GetMapping(value = "/detail/list/{groupId}")
	public CodeResponseVO getDetailCodeList( @PathVariable(name="groupId", required = true) int groupId ) {
		
		DetailCodeVO vo = new DetailCodeVO();
		vo.setGroupId(groupId);
		
		CodeResponseVO resVO = commonCodeService.getDetailCodeList(vo);
		
		return resVO;
	}
	
	/* 상세코드 등록 */
	@PostMapping(value = "/detail/write")
	public void createDetailCode( @RequestBody DetailCodeVO vo ) {
		commonCodeService.createDetailCode(vo);
	}
	
	/* 상세코드 수정 */
	@PostMapping(value = "/detail/update")
	public void updateDetailCode( @RequestBody DetailCodeVO vo ) {
		commonCodeService.updateDetailCode(vo);
	}
	
}
