package com.matjo.web.rank.dao;

/**
 * 맛조 RankDao
 * @author "dev.daehyoung"
 *
 */

import java.util.List;

import com.matjo.web.rank.bean.RankGroupBean;


public interface RankDao {
	
	/** 모임순위 조회 (리뷰수) **/
	public List<RankGroupBean> selectReviewGroupList();
	/** 모임순위 조회 (좋아요수) **/
	public List<RankGroupBean> selectLikeGroupList();
	
}
