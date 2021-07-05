package com.jimini.cmmncd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jimini.cmmncd.domain.CodeResponseVO;
import com.jimini.cmmncd.domain.DetailCodeVO;
import com.jimini.cmmncd.domain.GroupCodeVO;
import com.jimini.cmmncd.service.CommonCodeService;

@RestController
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
	@PostMapping(value = "/group/update/{groupId}")
	public void updateGroupCode( @RequestBody GroupCodeVO vo,
								 @PathVariable("groupId") int groupId ) {
		vo.setId(groupId);
		commonCodeService.updateGroupCode(vo);
	}
	
	
	/* 상세코드 리스트 */
	@GetMapping(value = "/detail/list/{groupId}")
	public CodeResponseVO getDetailCodeList( @PathVariable("groupId") int groupId ) {
		
		DetailCodeVO vo = new DetailCodeVO();
		vo.setGroupId(groupId);
		
		CodeResponseVO resVO = commonCodeService.getDetailCodeList(vo.getGroupId());
		
		return resVO;
	}
	
	/* 상세코드 등록 */
	@PostMapping(value = "/detail/write")
	public void createDetailCode( @RequestBody DetailCodeVO vo ) {
		commonCodeService.createDetailCode(vo);
	}
	
	/* 상세코드 수정 */
	@PostMapping(value = "/detail/update/{detailId}")
	public void updateDetailCode( @RequestBody DetailCodeVO vo,
								  @PathVariable("detailId") int detailId ) {
		vo.setId(detailId);
		commonCodeService.updateDetailCode(vo);
	}
	
}
