package com.matjo.web.resta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.resta.bean.DaumLocalBean;
import com.matjo.web.resta.dao.RestaDao;

@Service
public class RestaServiceImpl implements RestaService{

	@Autowired
	private RestaDao restaDao;

	// 맛집정보 조회
	@Override
	public DaumLocalBean selectResta(DaumLocalBean dlBean) throws Exception {
		if (dlBean.getMemberNo() != null) {
			int hasSubsResta = restaDao.selectHasSubsResta(dlBean);
			dlBean.setHasSubsResta(hasSubsResta>0?"true":"false");
		}
		return restaDao.selectResta(dlBean);
	}
	
	// 맞집정보 등록
	@Override
	public int insertResta(DaumLocalBean dlBean) throws Exception {
		return restaDao.insertResta(dlBean);
	}
	
	/** 모임 구독 */
	@Override
	public int insertSubsResta(DaumLocalBean dlBean) {
		return restaDao.insertSubsResta(dlBean);
	}

	/** 모임 구독 해제 */
	@Override
	public int deleteSubsResta(DaumLocalBean dlBean) {
		return restaDao.deleteSubsResta(dlBean);
	}

	/** 내 구독 모임 조회 */
	@Override
	public List<DaumLocalBean> selectSubsResta(MemberBean mBean) {
		return restaDao.selectSubsRestaList(mBean);
	}
	
	/** 구독여부 조회 **/
	@Override
	public int selectHasSubsResta(DaumLocalBean dlBean) {
		return restaDao.selectHasSubsResta(dlBean);
	}
	
} // end of class
