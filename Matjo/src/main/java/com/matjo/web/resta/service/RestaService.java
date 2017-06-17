package com.matjo.web.resta.service;

import java.util.List;

import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.resta.bean.DaumLocalBean;


public interface RestaService {
	
	/** 맛집정보를 조회해서 가져온다. **/
	public DaumLocalBean selectResta(DaumLocalBean bean) throws Exception;
	
	/** 맛집정보를 등록한다. **/
	public int insertResta(DaumLocalBean bean) throws Exception;
	
	/** 맛집 구독 */
	public int insertSubsResta(DaumLocalBean dlBean);
	/** 맛집 구독 해제*/
	public int deleteSubsResta(DaumLocalBean dlBean);
	/** 내 구독 맛집 조회 */
	public List<DaumLocalBean> selectSubsResta(MemberBean mBean);
	
	/* 구독 여부 조회 */
	public int selectHasSubsResta(DaumLocalBean dlBean);
	
} // end of interface
