package com.matjo.web.group.bean;

/** 모임 ~ 회원 연결 Bean */
public class CommonGroupBean {
	String groupNo;		// 모임 고유번호
	String memberNo;	// 회원 고유번호
	String groupDate;	// 가입일
	
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}
	public String getGroupDate() {
		return groupDate;
	}
	public void setGroupDate(String groupDate) {
		this.groupDate = groupDate;
	}
}
