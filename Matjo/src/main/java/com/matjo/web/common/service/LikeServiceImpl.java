package com.matjo.web.common.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.bean.LikeBean;
import com.matjo.web.common.dao.LikeDao;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.review.bean.ReviewBean;

@Service
public class LikeServiceImpl implements LikeService{

	@Autowired
	LikeDao likeDao;
	
	@Override
	public int selectLikeForMember(ReviewBean rBean) {
		return likeDao.selectLikeForMember(rBean);
	}

	@Override
	public int selectLikeForGroup(GroupBean gBean) {
		return likeDao.selectLikeForGroup(gBean);
	}

	@Override
	public int selectLikeForReview(ReviewBean rBean) {
		return likeDao.selectLikeForReview(rBean);
	}

	@Override
	public int selectLikeForResta(ReviewBean rBean) {
		return likeDao.selectLikeForResta(rBean);
	}

	@Override
	public int insertLike(LikeBean lBean) {
		return likeDao.insertLike(lBean);
	}

	@Override
	public int deleteLike(LikeBean lBean) {
		return likeDao.deleteLike(lBean);
	}

}
