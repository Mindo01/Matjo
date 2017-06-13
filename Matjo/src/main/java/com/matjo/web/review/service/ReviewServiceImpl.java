package com.matjo.web.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.review.bean.PereviewBean;
import com.matjo.web.review.bean.ReviewBean;
import com.matjo.web.review.dao.PereviewDao;
import com.matjo.web.review.dao.ReviewDao;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private PereviewDao pereviewDao;
	
	@Override
	public List<ReviewBean> selectReviewList(ReviewBean reviewBean) {
		return reviewDao.selectReviewList(reviewBean);
	}

	@Override
	public void selectPereviewList(ReviewBean rBean) {
		
	}

	
	// 모임-개인리뷰 목록 가져오기
	@Override
	public List<ReviewBean> selectReviewPereviewList(ReviewBean reviewBean) { // 파라미터로 들어오는 ReviewBean 에는 업소번호가 주입되어있다.
		List<ReviewBean> reviewList = selectReviewList(reviewBean); // 해당 업소를 대상으로 한 모임리뷰 조회
		for (int i = 0; i< reviewList.size(); i++) {
			// 선택된 Bean
			ReviewBean currentBean = reviewList.get(i); // 각 모임리뷰를 돌면서
			
			// 조회의 파라미터로 넘길 Bean
			ReviewBean paramBean = new ReviewBean(currentBean.getReviewNo()); // 리뷰 번호를 파라미터로 보내
			
			// ReviewBean 에 넣어줄 개인리뷰 목록
			List<PereviewBean> pereviewList = pereviewDao.selectPereviewList(paramBean); // 해당 모임리뷰에 해당하는 개인리뷰 목록을 취득한다.
			reviewList.get(i).setPereviewList(pereviewList); // 개인리뷰 목록을 ReviewBean에 적재하고 
		}
		
		return reviewList; // 완성된 ReviewBean 의 목록을 리턴한다.
	} // end of selectReviewPereviewList

	
	// 모임리뷰 등록
	@Override
	public int insertReview(ReviewBean reviewBean) {
		return reviewDao.insertReview(reviewBean);
	}

	@Override
	public int insertPereview(PereviewBean pereviewBean) {
		return pereviewDao.insertPereview(pereviewBean);
	}
	
	
} // end of class





















