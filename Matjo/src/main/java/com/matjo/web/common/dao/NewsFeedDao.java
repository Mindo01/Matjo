package com.matjo.web.common.dao;

import java.util.List;

import com.matjo.web.common.bean.NewsFeedBean;

public interface NewsFeedDao {
	/** SELECT : 뉴스피드 조회 */
	public List<NewsFeedBean> selectNewsFeedList();
}
