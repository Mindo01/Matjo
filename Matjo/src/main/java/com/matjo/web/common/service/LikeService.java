package com.matjo.web.common.service;

import com.matjo.web.common.bean.LikeBean;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.review.bean.ReviewBean;

public interface LikeService {

	/** SELECT : 좋아요 검색 (회원 기준) */
	public int selectLikeForMember(ReviewBean rBean);
	
	/** SELECT : 좋아요 개수 검색 (모임 기준) */
	public int selectLikeForGroup(GroupBean gBean);
	
	/** SELECT : 좋아요 개수 검색 (모임 리뷰 기준) */
	public int selectLikeForReview(ReviewBean rBean);
	
	/** SELECT : 좋아요 개수 검색 (업소 기준) */
	public int selectLikeForResta(ReviewBean rBean);
	
	/** INSERT : 좋아요 설정 */
	public int insertLike(LikeBean lBean);
	/** DELETE : 좋아요 해제 */
	public int deleteLike(LikeBean lBean);
}
