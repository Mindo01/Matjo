package com.matjo.web.rank.service;

import java.util.HashMap;

/**
 * 맛조 RankServiceImpl
 * @author "dev.daehyoung"
 *
 */

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.Constants;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.group.dao.GroupDao;
import com.matjo.web.rank.bean.RankGroupBean;
import com.matjo.web.rank.bean.RankRestaBean;
import com.matjo.web.rank.dao.RankDao;
import com.matjo.web.resta.bean.DaumLocalBean;
import com.matjo.web.resta.dao.RestaDao;


@Service
public class RankServiceImpl implements RankService{

	@Autowired
	private RankDao rankDao;
	@Autowired
	private GroupDao groupDao;
	@Autowired
	private RestaDao restaDao;
	
	// 모임 순위 조회
	@Override
	public Map<String, Object> selectRankGroupList() throws Exception {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "랭크 리스트 조회에 실패 하였습니다.");
		
		// 모임순위 조회(리뷰수)
		List<RankGroupBean> resReviewGroup = rankDao.selectReviewGroupList();
		if(resReviewGroup != null){
			// 모임번호를 이용하여 모임이름, 모임이미지 매핑
			for (int i = 0; i < resReviewGroup.size(); i++) {
				GroupBean gBean1 = new GroupBean();
				gBean1.setGroupNo(resReviewGroup.get(i).getGroupNo());
				GroupBean gBean2 = groupDao.selectGroupDetail(gBean1);
				resReviewGroup.get(i).setGroupName(gBean2.getGroupName());
				resReviewGroup.get(i).setGroupInfo(gBean2.getGroupInfo());
				resReviewGroup.get(i).setGroupImg(gBean2.getGroupImg());
			}
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			resMap.put(Constants.RESULT_MSG, "랭크 리스트 조회에 성공 하였습니다.");
			resMap.put("ReviewRankList", resReviewGroup);
		}
		
		// 모임순위 조회(좋아요수)
		List<RankGroupBean> resLikeGroup = rankDao.selectLikeGroupList();
		if(resLikeGroup != null){
			// 모임번호를 이용하여 모임이름, 모임이미지 매핑
			for (int i = 0; i < resLikeGroup.size(); i++) {
				GroupBean gBean1 = new GroupBean();
				gBean1.setGroupNo(resLikeGroup.get(i).getGroupNo());
				GroupBean gBean2 = groupDao.selectGroupDetail(gBean1);
				resLikeGroup.get(i).setGroupName(gBean2.getGroupName());
				resLikeGroup.get(i).setGroupInfo(gBean2.getGroupInfo());
				resLikeGroup.get(i).setGroupImg(gBean2.getGroupImg());
			}
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			resMap.put(Constants.RESULT_MSG, "랭크 리스트 조회에 성공 하였습니다.");
			resMap.put("LikeRankList", resLikeGroup);
		}
		
		return resMap;
	} // end of selectRankGroupList
	
	// 맛집 순위 조회
	@Override
	public Map<String, Object> selectRankRestaList() throws Exception {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "랭크 리스트 조회에 실패 하였습니다.");
		
		/** 맛집순위 조회 (한식) **/
		List<RankRestaBean> resKoreaResta = rankDao.selectKoreaRestaList();
		if(resKoreaResta != null && resKoreaResta.size() > 0){
			// 맛집번호를 이용하여 맛집이름, 맛집이미지 매핑
			for (int i = 0; i < resKoreaResta.size(); i++) {
				DaumLocalBean dBean1 = new DaumLocalBean();
				dBean1.setRestaId(resKoreaResta.get(i).getRestaId());
				DaumLocalBean dBean2 = restaDao.selectResta(dBean1);
				resKoreaResta.get(i).setRestaTitle(dBean2.getRestaTitle());
				resKoreaResta.get(i).setRestaImg(dBean2.getRestaImgUrl());
			}
			resMap.put("KoreaRankList", resKoreaResta);
		}
		
		/** 맛집순위 조회 (중식) **/
		List<RankRestaBean> resChinaResta = rankDao.selectChinaRestaList();
		if(resChinaResta != null && resChinaResta.size() > 0){
			// 맛집번호를 이용하여 맛집이름, 맛집이미지 매핑
			for (int i = 0; i < resChinaResta.size(); i++) {
				DaumLocalBean dBean1 = new DaumLocalBean();
				dBean1.setRestaId(resChinaResta.get(i).getRestaId());
				DaumLocalBean dBean2 = restaDao.selectResta(dBean1);
				resChinaResta.get(i).setRestaTitle(dBean2.getRestaTitle());
				resChinaResta.get(i).setRestaImg(dBean2.getRestaImgUrl());
			}
			resMap.put("ChinaRankList", resChinaResta);
		}
		
		/** 맛집순위 조회 (일식) **/
		List<RankRestaBean> resJapanResta = rankDao.selectJapanRestaList();
		if(resJapanResta != null && resJapanResta.size() > 0){
			// 맛집번호를 이용하여 맛집이름, 맛집이미지 매핑
			for (int i = 0; i < resJapanResta.size(); i++) {
				DaumLocalBean dBean1 = new DaumLocalBean();
				dBean1.setRestaId(resJapanResta.get(i).getRestaId());
				DaumLocalBean dBean2 = restaDao.selectResta(dBean1);
				resJapanResta.get(i).setRestaTitle(dBean2.getRestaTitle());
				resJapanResta.get(i).setRestaImg(dBean2.getRestaImgUrl());
			}
			resMap.put("JapanRankList", resJapanResta);
		}
		
		/** 맛집순위 조회 (양식) **/
		List<RankRestaBean> resUsaResta = rankDao.selectUsaRestaList();
		if(resUsaResta != null && resUsaResta.size() > 0){
			// 맛집번호를 이용하여 맛집이름, 맛집이미지 매핑
			for (int i = 0; i < resUsaResta.size(); i++) {
				DaumLocalBean dBean1 = new DaumLocalBean();
				dBean1.setRestaId(resUsaResta.get(i).getRestaId());
				DaumLocalBean dBean2 = restaDao.selectResta(dBean1);
				resUsaResta.get(i).setRestaTitle(dBean2.getRestaTitle());
				resUsaResta.get(i).setRestaImg(dBean2.getRestaImgUrl());
			}
			resMap.put("UsaRankList", resUsaResta);
		}
		
		/** 맛집순위 조회 (치킨) **/
		List<RankRestaBean> resChickenResta = rankDao.selectChickenRestaList();
		if(resChickenResta != null && resChickenResta.size() > 0){
			// 맛집번호를 이용하여 맛집이름, 맛집이미지 매핑
			for (int i = 0; i < resChickenResta.size(); i++) {
				DaumLocalBean dBean1 = new DaumLocalBean();
				dBean1.setRestaId(resChickenResta.get(i).getRestaId());
				DaumLocalBean dBean2 = restaDao.selectResta(dBean1);
				resChickenResta.get(i).setRestaTitle(dBean2.getRestaTitle());
				resChickenResta.get(i).setRestaImg(dBean2.getRestaImgUrl());
			}
			resMap.put("ChickenRankList", resChickenResta);
		}
		
		/** 맛집순위 조회 (전체) **/
		List<RankRestaBean> resAllResta = rankDao.selectRestaRankList();
		if(resAllResta != null && resAllResta.size() > 0){
			// 맛집번호를 이용하여 맛집이름, 맛집이미지 매핑
			for (int i = 0; i < resAllResta.size(); i++) {
				DaumLocalBean dBean1 = new DaumLocalBean();
				dBean1.setRestaId(resAllResta.get(i).getRestaId());
				DaumLocalBean dBean2 = restaDao.selectResta(dBean1);
				resAllResta.get(i).setRestaTitle(dBean2.getRestaTitle());
				resAllResta.get(i).setRestaImg(dBean2.getRestaImgUrl());
				resAllResta.get(i).setRestaCate(dBean2.getRestaCate());
			}
			resMap.put("RestaRankList", resAllResta);
		}
		
		return resMap;
	} // end of selectRankRestaList
	
} // end of class
