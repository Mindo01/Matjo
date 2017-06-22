package com.matjo.web.rank.dao;

/**
 * 맛조 RankDao
 * @author "dev.daehyoung"
 *
 */

import java.util.List;

import com.matjo.web.rank.bean.RankGroupBean;
import com.matjo.web.rank.bean.RankRestaBean;


public interface RankDao {
	
	/** 모임순위 조회 (리뷰수) **/
	public List<RankGroupBean> selectReviewGroupList();
	/** 모임순위 조회 (좋아요수) **/
	public List<RankGroupBean> selectLikeGroupList();
	/** 맛집순위 조회 (한식) **/
	public List<RankRestaBean> selectKoreaRestaList();
	/** 맛집순위 조회 (중식) **/
	public List<RankRestaBean> selectChinaRestaList();
	/** 맛집순위 조회 (일식) **/
	public List<RankRestaBean> selectJapanRestaList();
	/** 맛집순위 조회 (양식) **/
	public List<RankRestaBean> selectUsaRestaList();
	/** 맛집순위 조회 (치킨) **/
	public List<RankRestaBean> selectChickenRestaList();
	/** 맛집순위 조회 (전체) */
	public List<RankRestaBean> selectRestaRankList();
	
}
