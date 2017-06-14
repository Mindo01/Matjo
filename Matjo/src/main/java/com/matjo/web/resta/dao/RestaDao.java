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
	public DaumLocalBean selectResta(DaumLocalBean bean);
	
	/** 맛집정보를 삽입한다. **/
	public int insertResta(DaumLocalBean bean);
	
}
