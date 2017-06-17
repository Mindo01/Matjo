package com.matjo.web.matjoview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MatjoViewController {

	//멤버소개
	@RequestMapping("/matjoview/matjoMemberList")
	public String matjoMemberList(){
		return "/matjoview/matjoMemberList";
	}
	//사이트 소개
	@RequestMapping("/matjoview/matjoIntroduction")
	public String matjoIntroduction(){
		return "/matjoview/matjoIntroduction";
	}
	//맛조 history
	@RequestMapping("/matjoview/matjoHistory")
	public String matjoHistory(){
		return "/matjoview/matjoHistory";
	}
}
