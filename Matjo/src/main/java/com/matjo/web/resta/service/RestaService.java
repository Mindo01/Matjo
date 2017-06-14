package com.matjo.web.resta.service;

import com.matjo.web.resta.bean.DaumLocalBean;


public interface RestaService {
	
	/** 맛집정보를 조회해서 가져온다. **/
	public DaumLocalBean selectResta(DaumLocalBean bean) throws Exception;
	
	/** 맛집정보를 등록한다. **/
	public int insertResta(DaumLocalBean bean) throws Exception;
	
} // end of interface
