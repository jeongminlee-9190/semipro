package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
@Alias("PageDTO")
public class PageDTO {
	private List<SoNoticeDTO> list; // 게시판 목록
	private List<SoQnaDTO> qnaList; // 게시판 목록
	private int perPage=10; // 페이지 당 보여줄 갯수
	private int curPage; // 현재 페이지 번호
	private int totalCnt; // 전체 레코드 갯수
	private String searchName;
	private String searchValue;
	
	public PageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	//qna
	public PageDTO(List<SoQnaDTO> qnaList, int perPage, int curPage, int totalCnt) {
		super();
		this.qnaList = qnaList;
		this.perPage = perPage;
		this.curPage = curPage;
		this.totalCnt = totalCnt;
	}

	//notice
	public PageDTO(List<SoNoticeDTO> list, int perPage, int curPage, int totalcnt, String searchValue) {
		super();
		this.list = list;
		this.perPage = perPage;
		this.curPage = curPage;
		this.totalCnt = totalCnt;
		this.searchValue = searchValue;
	}

	public List<SoQnaDTO> getQnaList() {
		return qnaList;
	}

	public void setQnaList(List<SoQnaDTO> qnaList) {
		this.qnaList = qnaList;
	}

	public List<SoNoticeDTO> getList() {
		return list;
	}

	public void setList(List<SoNoticeDTO> list) {
		this.list = list;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
	
}
