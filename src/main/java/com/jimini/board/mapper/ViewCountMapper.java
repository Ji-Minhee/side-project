package com.jimini.board.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ViewCountMapper {

	/* view count 보기 */
	public int selectCount(String targetUrl);
	
	/* view count 증가 */
	public void updateCount(String targetUrl);
	
	
}
