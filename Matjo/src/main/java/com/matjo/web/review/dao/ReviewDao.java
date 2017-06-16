package com.matjo.web.review.dao;

import java.util.List;

import com.matjo.web.review.bean.ReviewBean;

public interface ReviewDao {
	
	public List<ReviewBean> selectReviewList(ReviewBean reviewBean);
	
	// 그룹 기준의 리뷰목록 조회
	public List<ReviewBean> selectReviewListForGroup(ReviewBean reviewBean);
	
	// 리뷰 등록
	public int insertReview(ReviewBean reviewBean);
	
	// 한개 리뷰의 별점 평균 조회
    public String selectReviewRatingAvg(ReviewBean reviewBean);
	
} // end of class