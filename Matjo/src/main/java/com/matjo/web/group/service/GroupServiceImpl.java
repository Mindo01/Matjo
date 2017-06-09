package com.matjo.web.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.Constants;
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
	public List<GroupBean> selectGroupList() {
		// TODO Auto-generated method stub
		return null;
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

	/** 모임가입 신청 */
	@Override
	public int insertGroupApply(GroupBean gBean) {
		// apply TABLE에 모임 가입 신청 등록
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
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
