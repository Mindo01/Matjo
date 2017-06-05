package com.matjo.web.group.dao;

import java.util.List;

import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.member.bean.MemberBean;

/** 모임 Dao */
public interface GroupDao {
	
	/** SELECT : 모임 상세정보 조회 */
	public GroupBean selectGroupDetail(GroupBean gBean);
	/** SELECT : 모임 소속 회원 목록 조회 */
	public List<MemberBean> selectGroupMember(GroupBean gBean);
	
	/** INSERT : 새 모임 등록 */
	public int insertGroup(GroupBean gBean);
	
}
