package com.smart.lms.util;

import java.sql.Date;

public class Pagination {

	private int currPageNo = 1; // 현재 페이지 번호
	private int sizePerPage = 10; // 한 페이지당 보여질 리스트 개수
	private int totalCnt; // 전체 목록 개수
	private int pageCnt; // 전체 페이지 개수

	private int startList; // 게시판 시작 번호
	private int range = 1; // 페이지 범위. 1 : 1~5 2: 6~10 ...
	private int pageSize = 5; // 한 페이지 범위에 보여질 페이지 개수
	private int startPage; // 각 페이지 범위의 시작 번호
	
	private String searchType; // 검색타입 (글제목, 글쓴이 등등)
	private String keyword; // 키워드
	private Date searchDate; //날짜

	private int endPage; // 각 페이지 범위 끝 번호

	private boolean prev; // 이전 페이지 여부
	private boolean next; // 다음 페이지 여부
	
	private int c_number;
	private int g_number;
	private int b_number;
	
	private int co_number;
	
	private String b_type;
	private String b_id;
	
	public int getB_number() {
		return b_number;
	}

	public void setB_number(int b_number) {
		this.b_number = b_number;
	}

	public int getCo_number() {
		return co_number;
	}

	public void setCo_number(int co_number) {
		this.co_number = co_number;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public int getCurrPageNo() {
		return currPageNo;
	}

	public void setCurrPageNo(int currPageNo) {
		this.currPageNo = currPageNo;
	}

	public int getSizePerPage() {
		return sizePerPage;
	}

	public void setSizePerPage(int sizePerPage) {
		this.sizePerPage = sizePerPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	

	public int getC_number() {
		return c_number;
	}

	public void setC_number(int c_number) {
		this.c_number = c_number;
	}

	public void pageInfo(int currPageNo, int range, int totalCnt) {
		this.currPageNo = currPageNo;
		this.range = range;
		this.totalCnt = totalCnt;

		// 전체 페이지 수
		this.pageCnt = (int) Math.ceil((double) totalCnt / sizePerPage);
		// 시작 페이지
		this.startPage = (range - 1) * pageSize + 1;
		// 끝 페이지
		this.endPage = range * pageSize;
		// 게시판 시작 번호
		this.startList = (currPageNo - 1) * sizePerPage;
		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;
		// 다음 버튼 상태
		this.next = endPage >= pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}

	@Override
	public String toString() {
		return "Pagination [currPageNo=" + currPageNo + ", sizePerPage=" + sizePerPage + ", totalCnt=" + totalCnt
				+ ", pageCnt=" + pageCnt + ", startList=" + startList + ", range=" + range + ", pageSize=" + pageSize
				+ ", startPage=" + startPage + ", searchType=" + searchType + ", keyword=" + keyword + ", endPage="
				+ endPage + ", prev=" + prev + ", next=" + next + "]";
	}

	public Date getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}

	public int getG_number() {
		return g_number;
	}

	public void setG_number(int g_number) {
		this.g_number = g_number;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}
	
	
	

}