package com.matjo.web.promotion.dao;


import com.matjo.web.promotion.bean.PromotionBean;

public interface PromotionDao {

	public int insertPromotion(PromotionBean gBean);

	public int insertPromotionFile(PromotionBean inBean);

	
}
