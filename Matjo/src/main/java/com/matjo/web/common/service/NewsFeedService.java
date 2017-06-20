package com.matjo.web.common.service;

import java.util.List;

import com.matjo.web.common.bean.NewsFeedBean;
import com.matjo.web.common.bean.PagingBean;

public interface NewsFeedService {

	/** SELECT : 좋아요 검색 (회원 기준) */
	public List<NewsFeedBean> selectNewsFeedList(PagingBean pBean);
}
