package com.jimini.cmmncd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimini.cmmncd.domain.CodeResponseVO;
import com.jimini.cmmncd.domain.DetailCodeVO;
import com.jimini.cmmncd.domain.GroupCodeVO;
import com.jimini.cmmncd.mapper.CommonCodeMapper;
import com.jimini.cmmncd.service.CommonCodeService;

@Service
public class CommonCodeServiceImpl implements CommonCodeService {

	@Autowired
	public CommonCodeMapper commonCodeMapper;
	
	
	@Override
	public List<GroupCodeVO> getGroupCodeList() {
		return commonCodeMapper.selectGroupCodeList();
	}
	
	@Override
	public void createGroupCode(GroupCodeVO vo) {
		commonCodeMapper.createGroupCode(vo);
	}
	
	@Override
	public void updateGroupCode(GroupCodeVO vo) {
		commonCodeMapper.updateGroupCode(vo);
	}
	
	@Override
	public int groupCodeTotalCount() {
		return commonCodeMapper.groupCodeTotalCount();
	}
	
	
	@Override
	public CodeResponseVO getDetailCodeList(DetailCodeVO vo) {
		
		CodeResponseVO resVO = new CodeResponseVO();
		
		//상세코드 리스트
		List<DetailCodeVO> detailCodeList = commonCodeMapper.selectDetailCodeList(vo);
		resVO.setDetailCodeList(detailCodeList);
		
		//상세코드 수
		int totCnt = commonCodeMapper.detailCodeTotalCount(vo);
		resVO.setTotCnt(totCnt);
		
		return resVO;
	}
	
	@Override
	public void createDetailCode(DetailCodeVO vo) {
		commonCodeMapper.createDetailCode(vo);
	}
	
	@Override
	public void updateDetailCode(DetailCodeVO vo) {
		commonCodeMapper.updateDetailCode(vo);
	}
	
	@Override
	public int detailCodeTotalCount(DetailCodeVO vo) {
		return commonCodeMapper.detailCodeTotalCount(vo);
	}
	
}
