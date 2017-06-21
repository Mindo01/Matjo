package com.matjo.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.AddressCityAPI;
import com.matjo.web.common.AddressLocalAPI;
import com.matjo.web.common.Constants;
import com.matjo.web.common.bean.AddressBean;
import com.matjo.web.member.bean.MemberBean;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String index() {
		return "index";	
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test";	
	}
	
	// 광역시/도 조회
	@RequestMapping("/searchAddressCityProc")
	@ResponseBody
	public Map<String, Object> searchAddressCityProc() {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		List<AddressBean> list = new AddressCityAPI().addrList;
		
		resMap.put("list", list);
		
		return resMap;
	}
	
	// 시/군/구 조회
	@RequestMapping("/searchAddressLocalProc")
	@ResponseBody
	public Map<String, Object> searchAddressLocalProc(MemberBean mBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		List<AddressBean> list = new AddressLocalAPI().getList(mBean.getMemberCity());
		
		resMap.put("list", list);
		
		return resMap;
	}
	
}
