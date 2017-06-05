package com.matjo.web.review.dao;

import java.util.List;

import com.matjo.web.review.bean.ReviewBean;

public interface ReviewDao {
	
	public List<ReviewBean> selectReviewList(ReviewBean reviewBean);
	
} // end of class
