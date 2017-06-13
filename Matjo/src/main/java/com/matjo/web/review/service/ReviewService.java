package com.matjo.web.review.service;

import java.util.List;

import com.matjo.web.review.bean.PereviewBean;
import com.matjo.web.review.bean.ReviewBean;

public interface ReviewService {

	/**
	 * 1개 업소 대상 모임리뷰 목록 조회
	 * @param reviewBean
	 * @return
	 */
	public List<ReviewBean> selectReviewList(ReviewBean reviewBean);
	
	
	/**
	 * 1개 업소 대상 모임+개인리뷰 목록 조회
	 * @param reviewBean 업소번호 조회를 위해 인자로 사용
	 * @return 모임리뷰목록을 반환, 각 모임리뷰에는 개인리뷰목록을 포함한다.
	 */
	public List<ReviewBean> selectReviewPereviewList(ReviewBean reviewBean);

	
	/**
	 * 1개 업소 대상 개인리뷰 목록조회
	 * @param rBean 업소번호 조회를 위해 인자로 사용
	 */
	public void selectPereviewList(ReviewBean rBean);
	

	/**
	 * 모임리뷰 등록
	 * @param reviewBean 등록하고자 하는 데이터의 객체
	 * @return 결과 수 (Affected Row Count)
	 */
	public int insertReview(ReviewBean reviewBean);
	

	/**
	 * 개인리뷰 등록
	 * @param pereviewBean
	 * @return
	 */
	public int insertPereview(PereviewBean pereviewBean);

	
} // end of interface
