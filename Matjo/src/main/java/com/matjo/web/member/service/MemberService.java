package com.matjo.web.member.service;

/**
 * 맛조 MemberService
 * @author "dev.daehyoung"
 *
 */

import java.util.List;

import com.matjo.web.member.bean.MemberBean;


public interface MemberService {
	
	/** 회원정보를 조회해서 가져온다. **/
	public MemberBean selectMember(MemberBean bean) throws Exception;
	
	/** 회원정보를 조회해서 가져온다. **/
	public MemberBean selectHp(MemberBean bean) throws Exception;
	
	/** 회원정보를 조회해서 리스트로 가져온다. **/
	public List<MemberBean> selectMemberList(MemberBean bean) throws Exception;
	
	/** 회원정보를 삽입한다. **/
	public int insertMember(MemberBean bean) throws Exception;
	
	/** 회원정보를 수정한다. **/
	public int updateMember(MemberBean bean) throws Exception;
	
	/** 회원정보를 삭제한다. **/
	public int deleteMember(MemberBean bean) throws Exception;
	
	/** 비밀번호 찾기 **/
	public MemberBean findMember(MemberBean bean) throws Exception;
	
}
