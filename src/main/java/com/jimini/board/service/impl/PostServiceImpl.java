package com.jimini.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimini.board.mapper.ViewCountMapper;
import com.jimini.board.service.PostService;

@Service
public class PostServiceImpl implements PostService {

//	@Autowired
//	public PostMapper postMapper;
	
	@Autowired
	public ViewCountMapper viewCountMapper;
	
//	public List<PostVO> getPostList(PostVO vo) throws Exception {
//		return postMapper.getPostList(vo);
//	}
	
	@Override
	public int getViewCount(String targetUrl) {
		return viewCountMapper.selectCount(targetUrl);
	}
	
	public void plusCount(String targetUrl) {
		viewCountMapper.updateCount(targetUrl);
	}
	
}
