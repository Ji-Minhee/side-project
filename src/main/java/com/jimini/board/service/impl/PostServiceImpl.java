package com.jimini.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jimini.board.domain.PostResponseVO;
import com.jimini.board.domain.PostVO;
import com.jimini.board.domain.ViewCountVO;
import com.jimini.board.mapper.PostMapper;
import com.jimini.board.mapper.ViewCountMapper;
import com.jimini.board.service.PostService;
import com.jimini.common.domain.PaginationVO;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	public PostMapper postMapper;
	
	@Autowired
	public ViewCountMapper viewCountMapper;
	
	
	@Override
	public PostResponseVO getPostList(PaginationVO vo) {
		
		PostResponseVO resVO = new PostResponseVO();
		
		//게시물 리스트
		List<PostVO> postList = postMapper.selectPostList(vo);
		resVO.setPostList(postList);
		
		//게시물 총 갯수
		int totCnt = postMapper.postTotalCount();
		resVO.setTotCnt(totCnt);
		
		//Pagination 객체 생성
		PaginationVO pagination = new PaginationVO();
		int page = 1;
		int range = 1;
		pagination.pageInfo(page, range, totCnt);
		resVO.setPagination(pagination);
		
		return resVO;
	}
	
	@Override
	public int postTotalCount() {
		return postMapper.postTotalCount();
	}
	
	@Override
	public PostResponseVO getPostDetail(PostVO vo) {
		
		PostResponseVO resVO = new PostResponseVO();
		
		//게시물 상세조회
		PostVO post = postMapper.selectPostDetail(vo);
		resVO.setPost(post);
		
		return resVO;
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
	public void hitPlus(Long pno) {
		postMapper.hitPlus(pno);
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
