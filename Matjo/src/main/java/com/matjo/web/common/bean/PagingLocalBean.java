package com.matjo.web.common.bean;

public class PagingLocalBean extends PagingBean{
	private String location;		// 중심좌표 		ex) 37.56331,126.97590
	private int radius;			// 반경거리
	private String image;			// 이미지 존재 여부	ex) all(모두), only(있는것만), not(없는것만)
	private String count;			// 요청 단위 건수
	private String page;			// 페이지 번호
	private String sort;			// 실제 정확도, 0(정확도순), 1(인기순), 2(거리순, 반드시 location 필요)
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getRadius() {
		return radius;
	}
	public void setRadius(int radius) {
		this.radius = radius;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
} // end of class
