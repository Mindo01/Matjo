package com.matjo.web.rank.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.Constants;
import com.matjo.web.rank.service.RankService;

@Controller
public class RankController {

	// 서비스 선언
	@Autowired
	private RankService rankService;
	
	// 랭크 화면
	@RequestMapping("/rank/selectRankForm")
	public String selectRankForm(){
		return "/rank/selectRank";
	}
	
	// 랭크 처리
	@RequestMapping("/rank/selectRankProc")
	@ResponseBody
	public Map<String, Object> selectRankProc() 
	{
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "랭크 리스트 조회에 실패 하였습니다.");
		try {
			resMap = rankService.selectRankGroupList();
		} catch (Exception e) {
			
		}
		return resMap;
	}
	
} // end of class
