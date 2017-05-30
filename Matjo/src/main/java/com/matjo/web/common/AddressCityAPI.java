package com.matjo.web.common;

import java.util.ArrayList;
import java.util.List;

import com.matjo.web.common.bean.AddressBean;

public class AddressCityAPI {
	public static List<AddressBean> addrList;
	
	public AddressCityAPI (){
		init();
	}
	
	private void init() {
		addrList = new ArrayList<AddressBean>();
		
		addrList.add(new AddressBean("1", "서울특별시"));
		addrList.add(new AddressBean("2", "부산광역시"));
		addrList.add(new AddressBean("3", "인천광역시"));
		addrList.add(new AddressBean("4", "광주광역시"));
		addrList.add(new AddressBean("5", "대구광역시"));
		addrList.add(new AddressBean("6", "대전광역시"));
		addrList.add(new AddressBean("7", "울산광역시"));
		addrList.add(new AddressBean("8", "경기도"));
		addrList.add(new AddressBean("9", "강원도"));
		addrList.add(new AddressBean("10", "충청북도"));
		addrList.add(new AddressBean("11", "충청남도"));
		addrList.add(new AddressBean("12", "전라북도"));
		addrList.add(new AddressBean("13", "전라남도"));
		addrList.add(new AddressBean("14", "경상북도"));
		addrList.add(new AddressBean("15", "경상남도"));
		addrList.add(new AddressBean("16", "제주도"));
	}
}
