package com.matjo.web.promotion.service;

import java.util.List;

import com.matjo.web.promotion.bean.PromotionBean;

public interface PromotionService {

	//프로모션저장
	public int insertPromotion(PromotionBean gBean);

	//프로모션 이미지 파일저장
	public int insertPromotionFile(PromotionBean bBean, String string);

	//프로모션 이미지 파일 리스트
	public List<PromotionBean> selectPromotionInfo(PromotionBean bBean);

}