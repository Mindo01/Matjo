package com.matjo.web.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.Constants;
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.group.dao.CommonGroupDao;
import com.matjo.web.group.dao.GroupDao;
import com.matjo.web.member.bean.MemberBean;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	GroupDao groupDao;
	@Autowired
	CommonGroupDao commonGroupDao;
	

	/** 모임 정보 1건 조회 : 모임에 대한 완전 상세 정보 */
	@Override
	public Map<String, Object> selectGroupDetail(GroupBean gBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "모임 정보 조회에 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		GroupBean bean = groupDao.selectGroupDetail(gBean);
		if (bean != null) {
			// 모임 소속원들 목록 받아 넘기기
			List<MemberBean> mBeanList = selectGroupMember(gBean);
			// 현재 로그인한 회원의 해당 모임 구독 여부 받아 넘기기
			if (gBean.getMemberNo() != null) {
				int hasSubsGroup = commonGroupDao.selectHasSubsGroup(gBean);
				bean.setHasSubsGroup(hasSubsGroup>0?"true":"false");
			}
			if (mBeanList.size() < 2) {
				// TODO 2명보다 적으면 1인 모임 =>> 정식 모임으로 취급 안함
			}
			resMap.put("gBean", bean);
			resMap.put("memberList", mBeanList);
			// 성공 정보 담아 보내기
			resMap.put(Constants.RESULT_MSG, "모임 정보 조회에 성공했습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		}
		return resMap;
	}

	/** 모임 목록 조회 */
	@Override
	public List<GroupBean> selectGroupList(PagingBean pBean) {
		if (pBean.getSearchText() == null) {
			pBean.setSearchText("");
		}
		// 페이징 처리와 검색 값 처리
		pBean.calcPage(groupDao.selectGroupCount(pBean));
		return groupDao.selectGroupList(pBean);
	}
	
	/** 모임 목록 조회 - 페이징 없이 전체 조회*/
	@Override
	public List<GroupBean> selectGroupToApply(PagingBean pBean) {
		if (pBean.getSearchText() == null) {
			pBean.setSearchText("");
		}
		// 페이징 처리 없이 넘기기
		pBean.setStartRow(0);
		pBean.setEndRow(groupDao.selectGroupCount(pBean));
		return groupDao.selectGroupList(pBean);
	}

	/** 모임소속회원 조회 */
	@Override
	public List<MemberBean> selectGroupMember(GroupBean gBean) {
		return groupDao.selectGroupMember(gBean);
	}

	/** 회원이 소속된 모임들 조회 */
	@Override
	public List<GroupBean> selectMemberGroup(MemberBean mBean) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 새모임등록 */
	@Override
	public int insertGroup(GroupBean gBean) {
		// group TABLE 모임 등록
		int res = groupDao.insertGroup(gBean);
		
		// 모임 등록 성공 시
		if (res > 0) {
			// mygroup TABLE 에 모임장 등록
			res = commonGroupDao.insertMyGroup(gBean);
		}
		return res;
	}
	
	/** 모임명이 존재하는지 확인 */
	@Override
	public int selectGroupByName(GroupBean gBean) {
		GroupBean bean = groupDao.selectGroupByName(gBean);
		if (bean != null) {
			return 1;
		}
		return 0;
	}

	/** 모임가입 신청 */
	@Override
	public int insertGroupApply(GroupBean gBean) {
		
		// 유효성 : 이미 가입 신청되어있는 사람 혹은 이미 모임에 가입해있는 사람인지 확인
		int res = commonGroupDao.selectIsGroupMember(gBean);
		if ( res > 0 ) {
			// 이미 가입 신청 중이거나 모임에 가입되어있는 회원일 때
			return -1;
		}
		
		// apply TABLE에 모임 가입 신청 등록
		// gBean의 Name만 들어올때! (No값이 없을 때 검색해서 넘기기)
		if (gBean.getGroupNo() == null || gBean.getGroupNo().equals("")) {
			GroupBean nBean = groupDao.selectGroupByName(gBean);
			gBean.setGroupNo(nBean.getGroupNo());
		}
		
		return commonGroupDao.insertApply(gBean);
	}
	
	/** 모임가입 완료시 내 모임에 등록 */
	@Override
	public int insertGroupMember(GroupBean gBean) {
		// apply TABLE에서 확인 완료로 수정 / 삭제
		int res = commonGroupDao.deleteApply(gBean);
		// mygroup TABLE 내모임에 등록
		if (res > 0) {
			res = commonGroupDao.insertMyGroup(gBean);
		}
		return res;
	}

	/** 모임 구독 */
	@Override
	public int insertSubsGroup(GroupBean gBean) {
		return commonGroupDao.insertSubsGroup(gBean);
	}

	/** 모임 구독 해제 */
	@Override
	public int deleteSubsGroup(GroupBean gBean) {
		return commonGroupDao.deleteSubsGroup(gBean);
	}

	/** 내 구독 모임 조회 */
	@Override
	public List<GroupBean> selectSubsGroup(MemberBean mBean) {
		return commonGroupDao.selectSubsGroupList(mBean);
	}

	
}
