package com.matjo.web.inquiry.bean;

public class InquiryBean {

	private String inquiryNo;
	private String inquiryMember;
	private String inquiryMemberName;	// 작성자 이름
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryCnt;
	private String inquiryDate;
	private String inquiryUpdate;
	private String inquiryIsOpen;
	private String inquiryReply="";
	private String inquiryRepDate;

	
	public InquiryBean() {
	}
	public InquiryBean(String inquiryNo, String inquiryMember) {
		this.inquiryNo = inquiryNo;
		this.inquiryMember = inquiryMember;
	}
	public String getInquiryNo() {
		return inquiryNo;
	}
	public String getInquiryMember() {
		return inquiryMember;
	}
	public String getInquiryMemberName() {
		return inquiryMemberName;
	}
	public void setInquiryMemberName(String inquiryMemberName) {
		this.inquiryMemberName = inquiryMemberName;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public String getInquiryContent() {
		return inquiryContent;
	}
	public String getInquiryCnt() {
		return inquiryCnt;
	}
	public String getInquiryDate() {
		return inquiryDate;
	}
	public String getInquiryUpdate() {
		return inquiryUpdate;
	}
	public String getInquiryIsOpen() {
		return inquiryIsOpen;
	}
	public String getInquiryReply() {
		return inquiryReply;
	}
	public String getInquiryRepDate() {
		return inquiryRepDate;
	}
	public void setInquiryNo(String inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public void setInquiryMember(String inquiryMember) {
		this.inquiryMember = inquiryMember;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}
	public void setInquiryCnt(String inquiryCnt) {
		this.inquiryCnt = inquiryCnt;
	}
	public void setInquiryDate(String inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	public void setInquiryUpdate(String inquiryUpdate) {
		this.inquiryUpdate = inquiryUpdate;
	}
	public void setInquiryIsOpen(String inquiryIsOpen) {
		this.inquiryIsOpen = inquiryIsOpen;
	}
	public void setInquiryReply(String inquiryReply) {
		this.inquiryReply = inquiryReply;
	}
	public void setInquiryRepDate(String inquiryRepDate) {
		this.inquiryRepDate = inquiryRepDate;
	}
	
}
