package com.matjo.web.review.dao;

import java.util.List;

import com.matjo.web.review.bean.PereviewBean;
import com.matjo.web.review.bean.ReviewBean;

public interface PereviewDao {
	public List<PereviewBean> selectPereviewList(ReviewBean rBean);
}
