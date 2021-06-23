package com.jimini.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimini.board.domain.PostVO;
import com.jimini.board.domain.ViewCountVO;
import com.jimini.board.mapper.PostMapper;
import com.jimini.board.mapper.ViewCountMapper;
import com.jimini.board.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	public PostMapper postMapper;
	
	@Autowired
	public ViewCountMapper viewCountMapper;
	
	
	@Override
	public List<PostVO> getPostList(PostVO vo) {
		return postMapper.selectPostList(vo);
	}
	
	@Override
	public void createPost(PostVO vo) {
		postMapper.createPost(vo);
	}
	
	@Override
	public void updatePost(PostVO vo) {
		postMapper.updatePost(vo);
	}
	
	@Override
	public int getViewCount(ViewCountVO targetUrl) {
		return viewCountMapper.selectCount(targetUrl);
	}
	
	@Override
	public void plusCount(String targetUrl) {
		viewCountMapper.updateCount(targetUrl);
	}
	
}
