package com.matjo.web.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.bean.NewsFeedBean;
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.common.dao.NewsFeedDao;
import com.matjo.web.member.bean.MemberBean;

@Service
public class NewsFeedServiceImpl implements NewsFeedService{

	@Autowired
	NewsFeedDao newsFeedDao;

	/** 뉴스피드 목록 조회 - 새 모임 등록 / 리뷰 등록 */
	@Override
	public List<NewsFeedBean> selectNewsFeedList(PagingBean pBean) {
		
		if (pBean != null && pBean.getPageNo() != -1) {
			// 페이징 처리와 검색 값 처리
			pBean.calcPage(newsFeedDao.selectNewsFeedCount());
		}
		return newsFeedDao.selectNewsFeedList(pBean);
	}

	@Override
	public List<NewsFeedBean> selectMyNoti(MemberBean mBean) {
		return newsFeedDao.selectMyNoti(mBean);
	}
	
	

}
