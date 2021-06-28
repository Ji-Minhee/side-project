package com.jimini.common.domain;

import lombok.Data;

@Data
public class PaginationVO {

	private int listSize = 10;		//초기값으로 목록개수를 10으로 셋팅		//한 페이지당 보여질 리스트의 개수
	private int rangeSize = 10;		//초기값으로 페이지범위를 10으로 셋팅	//화면에 보여질 페이지 갯수
	private int page;		//현재 페이지 넘버
	private int range;		//각 페이지 범위 시작 번호
	private int totCnt;		//전체 게시글 수
	private int pageCnt;	//전체 페이지 갯수
	private int startPage;	//시작 번호
	private int startList;
	private int endPage;	//끝 번호
	private boolean prev;	//이전 페이지 여부
	private boolean next;	//다음 페이지 여부

	public void pageInfo(int page, int range, int totCnt) {

		this.page = page;
		this.range = range;
		this.totCnt = totCnt;

		//전체 페이지수 
		//this.pageCnt = (int) Math.ceil(totCnt/listSize);
		this.pageCnt = (int) Math.ceil((double)totCnt/(double)listSize);

		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;

		//끝 페이지
		this.endPage = range * rangeSize;

		//게시판 시작번호
		this.startList = (page - 1) * listSize;

		//이전 버튼 상태
		this.prev = (range == 1 ? false : true);

		//다음 버튼 상태
		this.next = (endPage > pageCnt ? false : true);
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}

	}

}
