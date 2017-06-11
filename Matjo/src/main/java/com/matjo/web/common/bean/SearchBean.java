package com.matjo.web.common.bean;

/**
 * 검색용 빈
 */
public class SearchBean {
	String searchType;	// 검색 필터 (종류)
	String searchText;	// 검색 내용

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
}
