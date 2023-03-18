package com.web.jomaltwo.model;

import lombok.Data;

@Data
public class PageDTO {
	private int viewPage = 1; // 현재 보고있는 페이지
	private int blockSize = 5; 
	private int blockNum; // 블럭의 위치
	private int blockStart; 
	private int blockEnd;
	private int prevPage;
	private int nextPage;
	private int totalPage;
	private int totalCnt;
	
	private int startIndex; // 각 페이지별 시작값
	private int cntPerPage = 10; // 페이지별 게시글 수
	
	private int startRowNum;
	
	/////검색/////
	private String searchType;
	private String keyWord;


	public void setValue(int totalCnt, int cntPerPage) {
		
		this.totalCnt = totalCnt;
		
		this.cntPerPage =cntPerPage;
		
		// 전체 페이지수
		this.totalPage = (int)Math.ceil((double)totalCnt/cntPerPage);
		
		// 페이지별 시작 인텍스  : 0, 10,20,30 
		this.startIndex = (this.viewPage-1)*cntPerPage;
		
		//현재 페이지의 블럭위치 : 0부터 시작
		this.blockNum = (viewPage-1)/blockSize;
		
		//블럭 시작값 :1 ,6, 11...
		this.blockStart = (blockSize*blockNum)+1;
		
		// 5, 10, 15 ....
		this.blockEnd = blockStart + (blockSize-1);
		
		if(blockEnd > totalPage) blockEnd = totalPage;
		
		// 이전페이지
		this.prevPage = blockStart -1;
		
		// 다음페이지
		this.nextPage = blockEnd +1;
		
		// 전체 페이지수를 초과할 수 없음 
		if(nextPage > totalPage) nextPage = totalPage;
		
		//행 번호 구하기
		//totalCnt(전체 게시글 수)  : 106개 가정, 페이지당 게시글 수 : 10, 전체 페이지 : 11
		
		// 1페이지  -> 106 ~ 97
		// 2페이지  -> 96 ~ 87
		// 3페이지  -> 86 ~ 77
		// 4페이지  -> 76 ~ 67
		// ...
		
		// startRowNum : 페이지의 시작번호
		// 1페이지의 시작번호 : totalCnt - 0;
		// 2페이지의 시작번호 : totalCnt -10;
		// 3페이지의 시작번호 : totalCnt -20
		// ...
		this.startRowNum = totalCnt - (viewPage-1)*cntPerPage;
		
	}
}

