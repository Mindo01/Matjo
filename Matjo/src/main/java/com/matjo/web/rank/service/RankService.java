package com.matjo.web.rank.service;

import java.util.List;
import java.util.Map;

import com.matjo.web.rank.bean.RankRestaBean;


public interface RankService {
	
	/** 모임순위 조회 **/
	public Map<String, Object> selectRankGroupList() throws Exception;
	/** 맛집순위 조회**/
	public Map<String, Object> selectRankRestaList() throws Exception;
	
}
