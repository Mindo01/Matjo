package com.matjo.web.resta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.DaumUtils;
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.resta.bean.DaumLocalBean;
import com.matjo.web.review.bean.ReviewBean;
import com.matjo.web.review.service.ReviewService;

@Controller
public class RestaController {
	@Autowired
	ReviewService reviewService;
	
	
	/**
	 * 음식점 목록 조회 화면
	 * @return
	 */
	@RequestMapping("resta/selectRestaListForm")
	public String selectRestaListForm() {
		return "resta/selectRestaListForm";
	} // end of selectRestaForm
	
	
	/**
	 * 음식점 목록 조회 화면
	 * @return
	 */
	@RequestMapping("resta/selectRestaList")
	public String selectRestaList() {
		return "resta/selectRestaList";
	} // end of selectRestaForm
	
	
	/**
	 * 음식점 목록 조회 동작
	 * @param pagingBean 검색 키워드, 현재 위치, 반경거리, 페이지, 갯수 등의 검색조건의 내용을 갖는다.
	 * @return DaumLocalBean(음식점 객체)의 List 를 반환한다.
	 */
	@RequestMapping("resta/selectRestaListProc")
	@ResponseBody
	public Map<String, Object> selectRestaListProc(PagingBean pagingBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", "fail");
		resMap.put("resultMsg", "POI 조회에 실패 하였습니다.");
		
		try {
			List<DaumLocalBean> list = DaumUtils.searchDataForKeyword(pagingBean);
			if (list.size() > 0) {
				resMap.put("result", "ok");
				resMap.put("resultMsg", "POI 조회에 성공 하였습니다.");
				resMap.put("list", list);
				resMap.put("pagingBean", pagingBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} // end of try~catch
		
		return resMap;
	} // end of selectRestaProc
	
	
	/**
	 * 음식점 상세정보 화면
	 * @param dlBean API 로 부터 받은 음식점 목록에서, 클릭한 음식점의 데이터 객체
	 * @param model 넘겨받은 DaumLocalBean 을 model 에 심어 페이지를 리턴할 목적
	 * @return 뷰 리턴
	 */
	@RequestMapping("resta/selectRestaForm")
	public String selectRestaForm(DaumLocalBean dlBean, Model model) {
		model.addAttribute("dlBean", dlBean);
		return "resta/selectRestaForm";
	}
	
	
	/**
	 * 음식점 상세정보 Proc (모임-개인 리뷰 조회)
	 * @param dlBean ID 를 비교해 해당하는 리뷰와 그에속한 개인리뷰 목록을 가져온다.
	 * @return 데이터 리턴
	 */
	@RequestMapping("resta/selectRestaProc")
	@ResponseBody
	public Map<String, Object> selectRestaProc(DaumLocalBean dlBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", "fail");
		resMap.put("resultMsg", "리뷰 조회에 실패하였습니다.");
		
		ReviewBean rBean = new ReviewBean();
		rBean.setReviewRestaNo(dlBean.getRestaId());
		
		try {
//			List<ReviewBean> reviewList = reviewService.selectReviewList(rBean);
			List<ReviewBean> reviewList = reviewService.selectReviewPereviewList(rBean);
			if (reviewList.size() > 0) {
				resMap.put("reviewList", reviewList);
				resMap.put("result", "ok");
				resMap.put("resultMsg", "리뷰 조회에 성공하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	} // end of selectRestaProc
	
	
	/**
	 * 모임리뷰 등록
	 * @param reviewBean
	 * @return 등록 완료 후 작성결과 리턴
	 */
	public Map<String, Object> insertReviewProc(ReviewBean reviewBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", "fail");
		resMap.put("resultMsg", "모임리뷰 등록에 실패하였습니다.");
		
		reviewService.insertReview(reviewBean);
		
		return resMap;
	}
	
	
	/**
	 * 개인리뷰 등록
	 * @param reviewBean
	 * @return
	 */
	public Map<String, Object> insertPereviewProc(ReviewBean reviewBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", "fail");
		resMap.put("resultMsg", "모임리뷰 등록에 실패하였습니다.");
		
		
		return resMap;
	}
} // end of class









