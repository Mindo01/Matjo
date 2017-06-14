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
	
	private String reviewDate;
	
	private String reviewGroupName;
	
	private String avgRating;
	
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
		
		/* 평균 계산 */
		String avg = "0.0";
		double sum = 0;
		for (int i = 0; i < pereviewList.size(); i++) {
			sum += Double.parseDouble(pereviewList.get(i).getPereviewRating());
		}
		avg = String.format("%.1f", (sum/pereviewList.size()));
		this.avgRating = avg;
		
		/* 리뷰 최종 등록 날짜 설정 */
		if (pereviewList.size() > 0) {
			this.reviewDate = pereviewList.get(pereviewList.size()-1).getPereviewDate();
		} else {
			// 아직 개인리뷰가 하나도 없으면 null 설정
			this.reviewDate = null;
		}
	}
	public String getReviewGroupName() {
		return reviewGroupName;
	}
	public void setReviewGroupName(String reviewGroupName) {
		this.reviewGroupName = reviewGroupName;
	}
	public String getAvgRating() {
		return avgRating;
	}
	public void setAvgRating(String avgRating) {
		this.avgRating = avgRating;
	}
	
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	
} // end of class
