package com.matjo.web.resta.dao;

/**
 * 맛조 RestaDao
 * @author "dev.daehyoung"
 *
 */

import java.util.List;

import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.resta.bean.DaumLocalBean;


public interface RestaDao {

	/** 맛집정보를 조회해서 가져온다. **/
	public DaumLocalBean selectResta(DaumLocalBean dlBean);
	
	/** 맛집정보를 삽입한다. **/
	public int insertResta(DaumLocalBean dlBean);
	
	/** SELECT : 한 회원의 구독 모임 조회 */
	public List<DaumLocalBean> selectSubsRestaList(MemberBean mBean);
	/** INSERT : 구독 모임 등록 : 모임번호 + 회원번호 연결 */
	public int insertSubsResta(DaumLocalBean dlBean);
	/** DELETE : 구독 모임 해제 */
	public int deleteSubsResta(DaumLocalBean dlBean);
	/** SELECT : 회원의 모임 구독 여부 조회 */
	public int selectHasSubsResta(DaumLocalBean dlBean);
}
