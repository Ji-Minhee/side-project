package com.jimini.cmmncd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jimini.cmmncd.domain.DetailCodeVO;
import com.jimini.cmmncd.domain.GroupCodeVO;

@Mapper
public interface CommonCodeMapper {

	/* 전체 그룹코드 리스트 */
	public List<GroupCodeVO> selectGroupCodeList();
	
	/* 그룹코드 생성 */
	public void createGroupCode(GroupCodeVO vo);
	
	/* 그룹코드 수정 */
	public void updateGroupCode(GroupCodeVO vo);
	
	/* 총 그룹코드 수 */
	public int groupCodeTotalCount();
	
	/* 그룹코드 수 */
	public int groupCodeCount(String groupCode);
	
	
	
	
	/* 상세코드 리스트 */
	public List<DetailCodeVO> selectDetailCodeList(int groupId);
	
	/* 상세코드 생성 */
	public void createDetailCode(DetailCodeVO vo);
	
	/* 상세코드 수정 */
	public void updateDetailCode(DetailCodeVO vo);
	
	/* 상세코드 수 */
	public int detailCodeTotalCount(int groupId);

}
