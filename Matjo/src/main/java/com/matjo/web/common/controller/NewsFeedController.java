package com.matjo.web.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.Constants;
import com.matjo.web.common.bean.NewsFeedBean;
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.common.service.NewsFeedService;

@Controller
public class NewsFeedController {
	
	@Autowired
	NewsFeedService newsFeedService;
	
	/** F : (임시) 뉴스피드 보여주기 목록 */
	@RequestMapping("/newsfeed/selectNewsFeed")
	public String selectNewsFeed() {
		return "/newsfeed/selectNewsFeed";
	}
	
	/** P : 뉴스피드 목록 조회 */
	@RequestMapping("/newsfeed/selectNewsFeedProc")
	@ResponseBody
	public Map<String, Object> selectNewsFeedProc(PagingBean pBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "뉴스피드 목록 조회에 실패했습니다.");
		
		List<NewsFeedBean> newsFeedList = newsFeedService.selectNewsFeedList(pBean);
		if (newsFeedList != null) {
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			resMap.put(Constants.RESULT_MSG, "뉴스피드 목록 조회에 성공했습니다.");
			resMap.put("newsFeedList", newsFeedList);
		}
		return resMap;
	}
	
	/** P : (임시) 클릭 시 자동 매핑 - 모임 혹은 리뷰 검색으로 연결해주기
	 * @param nBean nBean의 모든 내용과 type!은 꼭 보내주기
	 * @return
	 */
	@RequestMapping("/newsfeed/selectNewsFeedDetail")
	@ResponseBody
	public String selectNewsFeedDetail(NewsFeedBean nBean) {
		// 종류 받아서 구분하기
		String type = nBean.getType();
		if (type != null) {
			if (type.equals("1")) {
				// 모임 상세 정보 조회로 이동
				return "redirect:/group/selectGroupDetailProc.do?groupNo="+nBean.getGroupNo();
			} else if (type.equals("2")) {
				// 리뷰 상세 정보 조회로 이동
				return "redirect:/review/selectReviewProc.do?reviewNo="+nBean.getReviewNo();
			}
		}
		// 그냥 목록으로 돌아가기
		return "/newsfeed/selectNewsFeed";
	}
	
}
