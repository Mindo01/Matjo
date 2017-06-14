package com.matjo.web.resta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.resta.bean.DaumLocalBean;
import com.matjo.web.resta.dao.RestaDao;

@Service
public class RestaServiceImpl implements RestaService{

	@Autowired
	private RestaDao restaDao;

	// 맛집정보 조회
	@Override
	public DaumLocalBean selectResta(DaumLocalBean bean) throws Exception {
		return restaDao.selectResta(bean);
	}
	
	// 맞집정보 등록
	@Override
	public int insertResta(DaumLocalBean bean) throws Exception {
		return restaDao.insertResta(bean);
	}
	
} // end of class
