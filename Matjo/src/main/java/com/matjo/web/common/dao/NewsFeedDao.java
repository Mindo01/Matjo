package com.matjo.web.common.dao;

import java.util.List;

import com.matjo.web.common.bean.NewsFeedBean;
import com.matjo.web.common.bean.PagingBean;

public interface NewsFeedDao {
	/** SELECT : 뉴스피드 조회 */
	public List<NewsFeedBean> selectNewsFeedList(PagingBean pBean);
	
	/** SELECT : 뉴스피드 목록 개수 조회 */
	public int selectNewsFeedCount();
}
