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

	@Override
	public MemberBean selectMember(MemberBean bean) throws Exception {
		return memberDao.selectMember(bean);
	}
	
	@Override
	public List<MemberBean> selectMemberList(MemberBean bean) throws Exception {
		return memberDao.selectMemberList(bean);
	}
	
	@Override
	public int insertMember(MemberBean bean) throws Exception {
		return memberDao.insertMember(bean);
	}
	
	@Override
	public int updateMember(MemberBean bean) throws Exception {
		return memberDao.updateMember(bean);
	}
	
	@Override
	public int deleteMember(MemberBean bean) throws Exception {
		return memberDao.deleteMember(bean);
	}

	@Override
	public MemberBean findMember(MemberBean bean) throws Exception {
		return memberDao.findMember(bean);
	}
	
}
