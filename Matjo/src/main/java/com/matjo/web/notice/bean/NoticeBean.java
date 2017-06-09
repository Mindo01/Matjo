package com.matjo.web.notice.bean;

public class NoticeBean {

	private String noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeCnt;
	private String noticeDate;
	private String noticeUpdate;
	
	private String memberNo;
	private String memberId="관리자";
	
	public NoticeBean() {
	}
	public NoticeBean(String memberNo, String memberId) {
		this.memberNo = memberNo;
		this.memberId = memberId;
	}
	public String getNoticeNo() {
		return noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public String getNoticeCnt() {
		return noticeCnt;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public String getNoticeUpdate() {
		return noticeUpdate;
	}
	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public void setNoticeCnt(String noticeCnt) {
		this.noticeCnt = noticeCnt;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public void setNoticeUpdate(String noticeUpdate) {
		this.noticeUpdate = noticeUpdate;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
}
