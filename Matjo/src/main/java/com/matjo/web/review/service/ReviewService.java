package com.matjo.web.review.service;

import java.util.List;

import com.matjo.web.review.bean.ReviewBean;

public interface ReviewService {

	// 특정업소대상 리뷰목록(모임) 조회
	public List<ReviewBean> selectReviewList(ReviewBean reviewBean);

	public void selectPereviewList(ReviewBean rBean);
	
	public List<ReviewBean> selectReviewPereviewList(ReviewBean reviewBean);

	public int insertReview(ReviewBean reviewBean);
	
	// 특정 업소를 대상으로, 모임리뷰(+해당 개인 리뷰들) 목록을 조회한다.
//	public List<Map<String, Object>> selectReviewList(DaumLocalBean dlBean);

} // end of interface
