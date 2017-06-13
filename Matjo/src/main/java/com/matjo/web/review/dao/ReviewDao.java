package com.matjo.web.review.dao;

import java.util.List;

import com.matjo.web.review.bean.ReviewBean;

public interface ReviewDao {
	
	public List<ReviewBean> selectReviewList(ReviewBean reviewBean);

	
	// 그룹 기준의 리뷰목록 조회
	public List<ReviewBean> selectReviewListForGroup(ReviewBean reviewBean);
	
	public int insertReview(ReviewBean reviewBean);
	
} // end of class