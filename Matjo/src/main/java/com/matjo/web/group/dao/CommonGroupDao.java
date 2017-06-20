package com.matjo.web.group.dao;

import java.util.List;

import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.member.bean.MemberBean;

/** 내모임, 구독모임 Dao */
public interface CommonGroupDao {
	
	/** INSERT : 내 모임 등록 : 모임번호 + 회원번호 연결 */
	public int insertMyGroup(GroupBean gBean);
	/** INSERT : 모임 가입 신청 임시 저장 */
	public int insertApply(GroupBean gBean);
	/** SELECT : 모임 가입 현황 조회(중복체크시 필요) **/
	public GroupBean selectApply(GroupBean gBean);
	/** DELETE : 모임 가입 신청 완료 후 삭제 */
	public int deleteApply(GroupBean gBean);
	/** SELECT : 이미 존재하는 모임원/모임가입신청자인지 확인 */
	public int selectIsGroupMember(GroupBean gBean);
	/** SELECT : 회원의 모임 구독 여부 조회 */
	public int selectHasSubsGroup(GroupBean gBean);
	/** SELECT : 한 회원의 구독 모임 조회 */
	public List<GroupBean> selectSubsGroupList(MemberBean mBean);
	/** INSERT : 구독 모임 등록 : 모임번호 + 회원번호 연결 */
	public int insertSubsGroup(GroupBean gBean);
	/** DELETE : 구독 모임 해제 */
	public int deleteSubsGroup(GroupBean gBean);
	
}
