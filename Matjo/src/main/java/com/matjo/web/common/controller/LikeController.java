package com.matjo.web.common.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.Constants;
import com.matjo.web.common.bean.LikeBean;
import com.matjo.web.common.service.LikeService;
import com.matjo.web.member.bean.MemberBean;

@Controller
public class LikeController {
	
	@Autowired
	LikeService likeService;
	
	/** P : 좋아요 설정 */
	@RequestMapping("/like/insertLike")
	@ResponseBody
	public Map<String, Object> inserLike(LikeBean lBean, HttpServletRequest req) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "좋아요 설정을 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		// 로그인한 회원 정보 설정
		MemberBean mBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		lBean.setLikeMember(mBean.getMemberNo());
		int res = likeService.insertLike(lBean);
		if (res > 0) {
			// 성공
			resMap.put(Constants.RESULT_MSG, "좋아요 설정을 성공했습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		}
		return resMap;
	}
	
	/** P : 좋아요 해제 */
	@RequestMapping("/like/deleteLike")
	@ResponseBody
	public Map<String, Object> deleteLike(LikeBean lBean, HttpServletRequest req) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "좋아요 해제를 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		// 로그인한 회원 정보 설정
		MemberBean mBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		lBean.setLikeMember(mBean.getMemberNo());
		int res = likeService.deleteLike(lBean);
		if (res > 0) {
			// 성공
			resMap.put(Constants.RESULT_MSG, "좋아요 해제를 성공했습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		}
		return resMap;
	}
}
