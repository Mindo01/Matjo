package com.matjo.web.promotion.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.matjo.web.common.Util;
import com.matjo.web.promotion.bean.PromotionBean;
import com.matjo.web.promotion.dao.PromotionDao;

@Service
public class PromotionServiceImpl implements PromotionService {
	
	@Autowired
	private PromotionDao promotionDao;
	

	/** 새모임등록 */
	@Override
	public int insertPromotion(PromotionBean gBean) {
		// group TABLE 모임 등록
		int res = promotionDao.insertPromotion(gBean);
		
		return res;
	}
	@Override
	public int insertPromotionFile(PromotionBean bBean, String upPath) {
		int res = promotionDao.insertPromotion(bBean);
		return res;
	}
	
	
	
	@Override
	public List<PromotionBean> selectPromotionInfo(PromotionBean bBean) {
		return null;
	}
}
