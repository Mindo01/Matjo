package com.matjo.web.resta.bean;


public class DaumLocalBean {
	private String restaId;
	private String restaTitle;
	private String restaCate;
	private String restaAddr;
	private String restaImgUrl;
	private String restaLat;
	private String restaLng;
	private String restaPhone;
	private String restaUrl;
	
	public DaumLocalBean() {
	}
	
	public DaumLocalBean(String restaId, String restaTitle, String restaCate, String restaAddr, String restaImgUrl,
			String restaLat, String restaLng, String restaPhone, String restaUrl) {
		super();
		this.restaId = restaId;
		this.restaTitle = restaTitle;
		this.restaCate = restaCate;
		this.restaAddr = restaAddr;
		this.restaImgUrl = restaImgUrl;
		this.restaLat = restaLat;
		this.restaLng = restaLng;
		this.restaPhone = restaPhone;
		this.restaUrl = restaUrl;
	}
	public String getRestaId() {
		return restaId;
	}
	public void setRestaId(String restaId) {
		this.restaId = restaId;
	}
	public String getRestaTitle() {
		return restaTitle;
	}
	public void setRestaTitle(String restaTitle) {
		this.restaTitle = restaTitle;
	}
	public String getRestaCate() {
		return restaCate;
	}
	public void setRestaCate(String restaCate) {
		this.restaCate = restaCate;
	}

	public String getRestaAddr() {
		return restaAddr;
	}

	public void setRestaAddr(String restaAddr) {
		this.restaAddr = restaAddr;
	}

	public String getRestaImgUrl() {
		return restaImgUrl;
	}
	public void setRestaImgUrl(String restaImgUrl) {
		this.restaImgUrl = restaImgUrl;
	}

	public String getRestaLat() {
		return restaLat;
	}

	public void setRestaLat(String restaLat) {
		this.restaLat = restaLat;
	}

	public String getRestaLng() {
		return restaLng;
	}

	public void setRestaLng(String restaLng) {
		this.restaLng = restaLng;
	}

	public String getRestaPhone() {
		return restaPhone;
	}

	public void setRestaPhone(String restaPhone) {
		this.restaPhone = restaPhone;
	}

	public String getRestaUrl() {
		return restaUrl;
	}

	public void setRestaUrl(String restaUrl) {
		this.restaUrl = restaUrl;
	}

} // end of class
