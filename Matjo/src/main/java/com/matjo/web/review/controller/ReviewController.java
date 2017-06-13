package com.matjo.web.review.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.review.bean.PereviewBean;
import com.matjo.web.review.bean.ReviewBean;
import com.matjo.web.review.service.ReviewService;

/**
 * 모임리뷰(ReviewBean), 개인리뷰(Pereview) 관련 컨트롤러
 * @author Daehee
 *
 */
@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	/**
	 * 모임리뷰 작성 화면 (임시)
	 * @return 화면
	 */
	@RequestMapping("/review/insertReviewForm")
	public String insertReviewForm() {
		return "/review/insertReviewForm";
	}
	
	
	/**
	 * 개인리뷰 작성 화면 (임시) 
	 * @return
	 */
	@RequestMapping("/review/insertPereviewForm")
	public String insertPereviewForm() {
		return "/review/insertPereviewForm";
	}
	
	
	/**
	 * 모임리뷰 등록                   
	 * @param reviewBean 등록할 리뷰객체를 인자로 받는다.
	 * @return 결과 메시지/객체 리턴
	 */
	@RequestMapping("/review/insertReviewProc")
	@ResponseBody
	public Map<String, Object> insertReviewProc(ReviewBean reviewBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", "fail");
		resMap.put("resultMsg", "모임리뷰 등록에 실패 하였습니다.");
		
		try {
			int res = reviewService.insertReview(reviewBean);
			if (res > 0) {
				resMap.put("result", "ok");
				resMap.put("resultMsg", "모임리뷰 등록에 성공 하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
		
	} // end of insertReviewProc
	
	
	/**
	 * 개인리뷰 등록
	 * @param pereviewBean
	 * @return 결과 메시지/객체 리턴
	 */
	@RequestMapping("/review/insertPereviewProc")
	@ResponseBody
	public Map<String, Object> insertPereviewProc(PereviewBean pereviewBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", "fail");
		resMap.put("resultMsg", "모임리뷰 등록에 실패 하였습니다.");
		
		try {
			int res = reviewService.insertPereview(pereviewBean);
			if (res > 0) {
				resMap.put("result", "ok");
				resMap.put("resultMsg", "모임리뷰 등록에 성공 하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
	
	
} // end of class









