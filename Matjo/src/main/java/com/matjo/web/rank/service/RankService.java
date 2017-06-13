package com.matjo.web.rank.service;

import java.util.Map;


public interface RankService {
	
	/** 모임순위 조회 **/
	public Map<String, Object> selectRankGroupList() throws Exception;
	
}
