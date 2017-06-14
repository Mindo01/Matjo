package com.matjo.web.promotion.service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.promotion.bean.PromotionBean;
import com.matjo.web.promotion.dao.PromotionDao;

@Service
public class PromotionServiceImpl implements PromotionService {
	
	@Autowired
	private PromotionDao promotionDao;
	
	@Override
	public List<PromotionBean> selectPromotionInfo(PromotionBean bBean) {
		return null;
	}
	@Override
	public int insertPromotionFile(PromotionBean bBean, String upPath) {
		int res = promotionDao.insertPromotion(bBean);
		return res;
	}
	
	//프로모션 등록
	@Override
	public int insertPromotion(PromotionBean gBean) {
		int res = promotionDao.insertPromotion(gBean);
		
		return res;
	}
	//프로모션 리스트-페이징 없이 조회
	@Override
	public List<PromotionBean> selectPromo(PagingBean pBean) {
		// 페이징 처리 없이 넘기기
		pBean.setStartRow(0);
		pBean.setEndRow(promotionDao.selectPromotionCount(pBean));
		return promotionDao.selectPromo(pBean);
		}
	@Override
	public int selectPromotion(PagingBean pagingBean) {
		return promotionDao.selectPromotionCount(pagingBean);
	}
}
