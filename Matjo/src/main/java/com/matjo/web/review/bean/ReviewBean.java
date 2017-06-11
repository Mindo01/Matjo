package com.matjo.web.review.bean;

import java.util.List;

public class ReviewBean {
	
	private String reviewNo;
	private String reviewGroupNo;
	private String reviewRestaNo;
	private String reviewRestaName;
	private String reviewRestaCate;
	private String reviewIsOpen;
	private List<PereviewBean> pereviewList;
	
	private String reviewGroupName;
	
	/* Constructors */
	public ReviewBean() {
	}
	public ReviewBean(String reviewNo) { // 리뷰넘버와 그룹넘버를 받는 생성자
		super();
		this.reviewNo = reviewNo;
	}

	public String getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewGroupNo() {
		return reviewGroupNo;
	}
	public void setReviewGroupNo(String reviewGroupNo) {
		this.reviewGroupNo = reviewGroupNo;
	}
	public String getReviewRestaNo() {
		return reviewRestaNo;
	}
	public void setReviewRestaNo(String reviewRestaNo) {
		this.reviewRestaNo = reviewRestaNo;
	}
	public String getReviewRestaName() {
		return reviewRestaName;
	}
	public void setReviewRestaName(String reviewRestaName) {
		this.reviewRestaName = reviewRestaName;
	}
	public String getReviewRestaCate() {
		return reviewRestaCate;
	}
	public void setReviewRestaCate(String reviewRestaCate) {
		this.reviewRestaCate = reviewRestaCate;
	}
	public String getReviewIsOpen() {
		return reviewIsOpen;
	}
	public void setReviewIsOpen(String reviewIsOpen) {
		this.reviewIsOpen = reviewIsOpen;
	}
	public List<PereviewBean> getPereviewList() {
		return pereviewList;
	}
	public void setPereviewList(List<PereviewBean> pereviewList) {
		this.pereviewList = pereviewList;
	}
	public String getReviewGroupName() {
		return reviewGroupName;
	}
	public void setReviewGroupName(String reviewGroupName) {
		this.reviewGroupName = reviewGroupName;
	}
	
} // end of class
