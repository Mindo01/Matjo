package com.matjo.web.common.bean;

/** 좋아요  Bean */
public class LikeBean {
	private String likeMember;	// 좋아요 회원
	private String likeReview;	// 좋아요 리뷰
	
	public String getLikeMember() {
		return likeMember;
	}
	public void setLikeMember(String likeMember) {
		this.likeMember = likeMember;
	}
	public String getLikeReview() {
		return likeReview;
	}
	public void setLikeReview(String likeReview) {
		this.likeReview = likeReview;
	}
}
