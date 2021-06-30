package com.jimini.cmmncd.service;

import java.util.List;

import com.jimini.cmmncd.domain.CodeResponseVO;
import com.jimini.cmmncd.domain.DetailCodeVO;
import com.jimini.cmmncd.domain.GroupCodeVO;

public interface CommonCodeService {

	/* 그룹코드 리스트 */
	public List<GroupCodeVO> getGroupCodeList();
	
	/* 그룹코드 생성 */
	public void createGroupCode(GroupCodeVO vo);
	
	/* 그룹코드 수정 */
	public void updateGroupCode(GroupCodeVO vo);
	
	/* 총 그룹코드 수 */
	public int groupCodeTotalCount();
	
	
	/* 상세코드 리스트 */
	public CodeResponseVO getDetailCodeList(DetailCodeVO vo);
	
	/* 상세코드 생성 */
	public void createDetailCode(DetailCodeVO vo);
	
	/* 상세코드 수정 */
	public void updateDetailCode(DetailCodeVO vo);
	
	/* 상세코드 수 */
	public int detailCodeTotalCount(DetailCodeVO vo);
	
}
