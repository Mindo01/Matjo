package com.matjo.web.common.bean;

public class AddressBean {
	
	private String name;
	private String code;
	
	public AddressBean(){
	}
	
	public AddressBean(String code, String name) {
		this.code = code;
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
