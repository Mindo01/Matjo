package com.matjo.web.group.bean;

/** 모임 Bean */
public class GroupBean extends CommonGroupBean {
//	String groupNo;		// 모임 고유번호 (CommonGroupBean)
//	String groupLeader;	// 모임장 회원번호 (CommonGroupBean)
	String groupName;	// 모임장 이름
//	String groupDate;	// 모임 등록일자 (CommonGroupBean)
	String groupInfo;	// 모임 정보
	String groupImg;	// 모임 대표 이미지
	
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupInfo() {
		return groupInfo;
	}
	public void setGroupInfo(String groupInfo) {
		this.groupInfo = groupInfo;
	}
	public String getGroupImg() {
		return groupImg;
	}
	public void setGroupImg(String groupImg) {
		this.groupImg = groupImg;
	}
	
}
