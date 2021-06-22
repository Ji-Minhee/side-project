package com.jimini.board.service;

public interface PostService {

	public int getViewCount(String targetUrl);
	
	public void plusCount(String targetUrl);
	
}
