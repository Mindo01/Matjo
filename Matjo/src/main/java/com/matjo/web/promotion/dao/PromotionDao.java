package com.matjo.web.promotion.dao;


import java.util.List;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.promotion.bean.PromotionBean;

public interface PromotionDao {

	public int insertPromotion(PromotionBean gBean);
	public int insertPromotionFile(PromotionBean inBean);

	//프로모션 리스트
		public List<PromotionBean> selectPromo(PagingBean pBean);
	//프로모션 갯수 조회
		public int selectPromotionCount(PagingBean pBean);
	//프로모션 삭제
		public int deletePromo(PromotionBean promotionBean);
}
