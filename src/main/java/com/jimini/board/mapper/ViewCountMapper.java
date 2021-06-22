package com.jimini.board.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jimini.board.domain.ViewCountVO;

@Mapper
public interface ViewCountMapper {

	/* view count 보기 */
	public int selectCount(String targetUrl);
	
	/* view count 증가 */
	public void updateCount(String targetUrl);
	
	
}
