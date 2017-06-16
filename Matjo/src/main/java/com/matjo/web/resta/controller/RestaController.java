package com.matjo.web.resta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.Constants;
import com.matjo.web.common.DaumUtils;
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.resta.bean.DaumLocalBean;
import com.matjo.web.resta.service.RestaService;
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
		resMap.put("resultMsg", "목록 조회에 실패 하였습니다.");
		
		try {
			List<DaumLocalBean> list = DaumUtils.searchDataForKeyword(pagingBean);
			if (list.size() > 0) {
				resMap.put("result", "ok");
				resMap.put("resultMsg", "목록 조회에 성공 하였습니다.");
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
	 * 음식점 상세정보 화면 (템플릿, AngularJS 적용)
	 * @param dlBean dlBean API 로 부터 받은 음식점 목록에서, 클릭한 음식점의 데이터 객체
	 * @param model 넘겨받은 DaumLocalBean 을 model 에 심어 페이지를 리턴할 목적
	 * @return 뷰(jsp) 리턴
	 */
	@RequestMapping("resta/selectRestaDetail")
	public String selectRestaDetail(DaumLocalBean dlBean, Model model) {
		model.addAttribute("dlBean", dlBean);
		return "resta/selectRestaDetail";
	} // end of selectRestaDetail
	
	
	/**
	 * 음식점 상세정보 Proc (모임-개인 리뷰 조회)
	 * @param dlBean ID 를 비교해 해당하는 리뷰와 그에속한 개인리뷰 목록을 가져온다.
	 * @return 데이터 리턴
	 */
	@RequestMapping("resta/selectRestaProc")
	@ResponseBody
	public Map<String, Object> selectRestaProc(DaumLocalBean dlBean, HttpServletRequest req) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", "fail");
		resMap.put("resultMsg", "리뷰 조회에 실패하였습니다.");
		
		ReviewBean rBean = new ReviewBean();
		rBean.setReviewRestaNo(dlBean.getRestaId());
		
		// 현재 로그인한 회원 정보 넘기기
		MemberBean mBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		if (mBean != null) {
			rBean.setMemberNo(mBean.getMemberNo());
			// 리뷰빈에 현재 보고 있는 로그인 아이디 설정 (좋아요 검색용)
			rBean.setReviewNowMember(mBean.getMemberNo());
		}
		try {
            List<ReviewBean> reviewList = reviewService.selectReviewPereviewList(rBean);
            String reviewRatingAvg = reviewService.selectReviewRatingAvg(rBean);
            if (reviewRatingAvg == null) reviewRatingAvg = "0.0";
            else reviewRatingAvg = String.format("%.1f", Double.parseDouble(reviewRatingAvg));
            if (reviewList.size() > 0) {
                resMap.put("reviewList", reviewList);
                resMap.put("reviewRatingAvg", reviewRatingAvg);
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
	public Map<String, Object> insertReviewProc(ReviewBean reviewBean, DaumLocalBean dBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("result", "fail");
		resMap.put("resultMsg", "모임리뷰 등록에 실패하였습니다.");
		
		reviewService.insertReview(reviewBean);
		
		// TODO 안드로이드에서 DaumLocalBean 처리 이후 등록가능
//		insertRestaProc(dBean);
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
	
	
	
	/***** 맛집DB 이용 *****/
	
	// 서비스 선언
	@Autowired
	private RestaService restaService;
	
	// 맛집정보 조회
	@RequestMapping("/resta/selectRestaProcDB")
	@ResponseBody
	public Map<String, Object> selectResta(DaumLocalBean dBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "맛집정보 조회에 실패 하였습니다.");
		
		try {
			DaumLocalBean bean = restaService.selectResta(dBean);
			
			if(bean != null) {
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "맛집정보 조회에 성공 하였습니다.");
				resMap.put("restaBean", bean);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
	
	// 맛집정보 등록
	@RequestMapping("/resta/insertRestaProc")
	@ResponseBody
	public Map<String, Object> insertRestaProc(DaumLocalBean bean){
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "맛집정보 등록에 실패 하였습니다.");
		
		try {
			int res = restaService.insertResta(bean);
			if(res > 0){
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "맛집정보 등록에 성공 하였습니다.");
			}
		}catch (Exception e) {
			
		}
		return resMap;
	}
	
} // end of class









