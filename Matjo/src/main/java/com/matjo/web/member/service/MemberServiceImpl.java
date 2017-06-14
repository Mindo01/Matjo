package com.matjo.web.member.service;

/**
 * 맛조 MemberServiceImpl
 * @author "dev.daehyoung"
 *
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.member.dao.MemberDao;


@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDao memberDao;
	
	// 회원정보 조회
	@Override
	public MemberBean selectMember(MemberBean bean) throws Exception {
		return memberDao.selectMember(bean);
	}
	
	// 회원정보 리스트 조회
	@Override
	public List<MemberBean> selectMemberList(MemberBean bean) throws Exception {
		return memberDao.selectMemberList(bean);
	}
	
	// 회원정보 삽입
	@Override
	public int insertMember(MemberBean bean) throws Exception {
		return memberDao.insertMember(bean);
	}
	
	// 회원정보 수정
	@Override
	public int updateMember(MemberBean bean) throws Exception {
		return memberDao.updateMember(bean);
	}
	
	// 회원정보 삭제
	@Override
	public int deleteMember(MemberBean bean) throws Exception {
		return memberDao.deleteMember(bean);
	}

	// 비밀번호 찾기
	@Override
	public MemberBean findMember(MemberBean bean) throws Exception {
		return memberDao.findMember(bean);
	}
	
} // end of class
