package com.matjo.web.group.service;

import java.util.List;
import java.util.Map;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.member.bean.MemberBean;

public interface GroupService {
	/** 모임 정보 1건 조회 */
	public Map<String, Object> selectGroupDetail(GroupBean gBean);
	/** 모임 목록 조회 */
	public List<GroupBean> selectGroupList(PagingBean pBean);
	/** 모임 목록 모두 조회 (Paging 없이) */
	public List<GroupBean> selectGroupToApply(PagingBean pBean);
	/** 모임소속회원 조회 */
	public List<MemberBean> selectGroupMember(GroupBean gBean);
	/** 회원이 소속된 모임들 조회 */
	public List<GroupBean> selectMemberGroup(MemberBean mBean);
	/** 새모임등록 */
	public int insertGroup(GroupBean gBean);
	/** 모임 가입 신청 */
	public int insertGroupApply(GroupBean gBean);
	/** 모임가입 */
	public int insertGroupMember(GroupBean gBean);
	/** 모임 구독 */
	public int insertSubsGroup(GroupBean gBean);
	/** 모임 구독 해제*/
	public int deleteSubsGroup(GroupBean gBean);
	/** 내 구독 모임 조회 */
	public List<GroupBean> selectSubsGroup(MemberBean gBean);
}
