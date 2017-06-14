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
import com.matjo.web.rank.dao.RankDao;


@Service
public class RankServiceImpl implements RankService{

	@Autowired
	private RankDao rankDao;
	@Autowired
	private GroupDao groupDao;
	
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
	
} // end of class
