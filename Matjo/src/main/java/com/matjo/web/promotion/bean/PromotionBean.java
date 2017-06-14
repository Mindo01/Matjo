package com.matjo.web.promotion.bean;

import org.springframework.web.multipart.MultipartFile;

import com.matjo.web.common.bean.CommonBean;

public class PromotionBean extends CommonBean {

	private String promoNo;
	private String promoCode;
	private String promoResta;
	private String promoContent;
	private String promoStart;
	private String promoEnd;
	private String promoImg;
	private String promoCate;
	
	
	public PromotionBean() {
	}
	
	public String getPromoNo() {
		return promoNo;
	}
	public void setPromoNo(String promoNo) {
		this.promoNo = promoNo;
	}
	public String getPromoCode() {
		return promoCode;
	}
	public void setPromoCode(String promoCode) {
		this.promoCode = promoCode;
	}
	public String getPromoResta() {
		return promoResta;
	}
	public void setPromoResta(String promoResta) {
		this.promoResta = promoResta;
	}
	public String getPromoContent() {
		return promoContent;
	}
	public void setPromoContent(String promoContent) {
		this.promoContent = promoContent;
	}
	public String getPromoStart() {
		return promoStart;
	}
	public void setPromoStart(String promoStart) {
		this.promoStart = promoStart;
	}
	public String getPromoEnd() {
		return promoEnd;
	}
	public void setPromoEnd(String promoEnd) {
		this.promoEnd = promoEnd;
	}
	public String getPromoImg() {
		return promoImg;
	}
	public void setPromoImg(String promoImg) {
		this.promoImg = promoImg;
	}

	public String getPromoCate() {
		return promoCate;
	}

	public void setPromoCate(String promoCate) {
		this.promoCate = promoCate;
	}
	
}
