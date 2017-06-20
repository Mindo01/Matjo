package com.matjo.web.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.bean.NewsFeedBean;
import com.matjo.web.common.dao.NewsFeedDao;

@Service
public class NewsFeedServiceImpl implements NewsFeedService{

	@Autowired
	NewsFeedDao newsFeedDao;

	/** 뉴스피드 목록 조회 - 새 모임 등록 / 리뷰 등록 */
	@Override
	public List<NewsFeedBean> selectNewsFeedList() {
		return newsFeedDao.selectNewsFeedList();
	}

}
