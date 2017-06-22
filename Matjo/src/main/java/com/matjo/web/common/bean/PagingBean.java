package com.matjo.web.common.bean;


/**
 * @author dev.james.jeong (Daehee Jeong)
 *
 */
public class PagingBean extends CommonBean{
	
	/** 한 페이지 당 보여지는 레코드의 갯수 **/
	public static final int COUNT_PER_RECORD = 10;
	
	/** 페이징 그룹당 보여지는 페이지의 갯수 **/
	public static final int COUNT_PER_PAGE_GROUP = 10;
	
	
	/** 요청 페이지 번호 **/
	private int pageNo;
	/** 전체 레코드 갯수 **/
	private int totalRecordCount;
	/** 전체 페이지 갯수 **/
	private int totalPageCount;
	/** DB 시작 row **/
	private int startRow;
	/** DB 종료 row **/
	private int endRow;
	
	/** 검색 항목 **/
	private String searchType;
	/** 검색 내용 **/
	private String searchText;
	/** 검색된 개수 **/
	private String searchCount;
	
	/** 전체 페이지의 그룹 갯수 **/
	private int totalGroupCount;
	/** 현재 페이지의 그룹번호(그룹번호는 1부터 시작) **/
	private int pageGroupNo;	// groupNo와 헷갈릴 수 있어서 앞에 page를 붙힘
	
	/** 시작 페이지 번호 **/
	private int pageStartNo;
	/** 끝 페이지 번호 **/
	private int pageEndNo;
	
	
	/** 위치값('위도,경도') **/
	private String location;
	
	/** 반지름값(반경) **/
	private int radius; // default: 5000, min: 0, max: 20000
	
	private String groupNo;	// 모임 검색에 이용하기 위한 번호
	
	
	/**
	 * 화면에 표시할 페이징 변수정보를 계산한다.
	 * @param totalRecordCount 전체 레코드 갯수
	 */
	public void calcPage(int totalRecordCount) { // 페이징은 전체 레코드 갯수로 부터 시작한다 !
		// 페이지 디폴트 값은 무조건 1 이다.
		this.pageNo = (pageNo == 0 ? 1 : pageNo);
		this.totalRecordCount = totalRecordCount;
		
		// 페이지 갯수 계산
		totalPageCount = calcTotalPageCount(this.totalRecordCount, COUNT_PER_RECORD);
		
		
		// DB 에서 가져올 시작행 번호
		startRow = (pageNo - 1) * COUNT_PER_RECORD; // 여기부터
		// DB 에서 가져올 행 갯수
		endRow = COUNT_PER_RECORD;						// n 개 가져옴
		
		// /////// 그룹
		// 전체 그룹의 갯수
		totalGroupCount = calcTotalPageCount(totalPageCount, COUNT_PER_PAGE_GROUP);
		// 현재 페이지의 소속 그룹번호 계산
		pageGroupNo = calcTotalPageCount(pageNo, COUNT_PER_PAGE_GROUP);
		
		// 시작 페이지 번호
		pageStartNo = ((pageGroupNo - 1) * COUNT_PER_PAGE_GROUP) + 1;
		// 끝 페이지 번호
		pageEndNo = pageStartNo + COUNT_PER_PAGE_GROUP - 1;
		
		// 마지막 페이지번호보다 끝페이지 번호가 크다면
		// 더이상 페이지가 없는 것이기 때문에 전체 페이지 갯수를 대입한다.
		if (pageEndNo >= totalPageCount) {
			pageEndNo = totalPageCount;
		}
		
	} // end of calcPage
	
	/**
	 * 전체 레코드 갯수에 대한 화면에 표시할 페이지수 계산
	 * @param totalRecordCount 전체 레코드 갯수
	 * @param countPerPage 한화면에 표시할 페이지 그룹 갯수
	 * @return
	 */
	public int calcTotalPageCount(int totalRecordCount, int countPerPage) {
		int totalPageCount = 0;
		if (totalRecordCount > 0) {
			totalPageCount = totalRecordCount / countPerPage;
			if (totalRecordCount % countPerPage > 0) {
				totalPageCount += 1;
			}
		}
		return totalPageCount;
	} // end of calcTotalPageCount

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public int getTotalGroupCount() {
		return totalGroupCount;
	}

	public void setTotalGroupCount(int totalGroupCount) {
		this.totalGroupCount = totalGroupCount;
	}

	public int getPageGroupNo() {
		return pageGroupNo;
	}

	public void setPageGroupNo(int pageGroupNo) {
		this.pageGroupNo = pageGroupNo;
	}

	public int getPageStartNo() {
		return pageStartNo;
	}

	public void setPageStartNo(int pageStartNo) {
		this.pageStartNo = pageStartNo;
	}

	public int getPageEndNo() {
		return pageEndNo;
	}

	public void setPageEndNo(int pageEndNo) {
		this.pageEndNo = pageEndNo;
	}

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

	public String getSearchCount() {
		return searchCount;
	}

	public void setSearchCount(String searchCount) {
		this.searchCount = searchCount;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getRadius() {
		return radius;
	}

	public void setRadius(int radius) {
		this.radius = radius;
	}

	public String getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	
	
	
} // end of class










