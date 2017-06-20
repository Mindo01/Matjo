package com.matjo.web.common.bean;

public class NewsFeedBean {
	private String groupNo;		// 모임 번호	//모임//리뷰
	private String groupName;	// 모임 이름	//모임//리뷰
	private String groupLeader; // 모임장		//모임
	private String reviewNo;	// 리뷰 번호	//리뷰
	private String restaName;	// 업소 이름	//리뷰
	private String restaCate;	// 업소 카테고리	//리뷰
	private String regDate;		// 날짜시간	//모임//리뷰
	
	private String type;		// 종류번호 - 모임:1/리뷰:2
	private String typeMsg;		// 종류 - 새 모임이 / 리뷰가 (등록되었습니다)
	
	
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupLeader() {
		return groupLeader;
	}
	public void setGroupLeader(String groupLeader) {
		this.groupLeader = groupLeader;
	}
	public String getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getRestaName() {
		return restaName;
	}
	public void setRestaName(String restaName) {
		this.restaName = restaName;
	}
	public String getRestaCate() {
		return restaCate;
	}
	public void setRestaCate(String restaCate) {
		this.restaCate = restaCate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTypeMsg() {
		return typeMsg;
	}
	public void setTypeMsg(String typeMsg) {
		this.typeMsg = typeMsg;
	}
	
	
}
