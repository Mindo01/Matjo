package com.matjo.web.group.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.Constants;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.member.bean.MemberBean;

@Controller
public class GroupController {
	
	/** F : 모임 정보 화면 */
	@RequestMapping("/group/selectGroupDetailView")
	public String selectGroupDetailView() {
		return "/group/selectGroupDetailView";
	}
	
	/** P : 모임 정보 조회 처리 AJAX */
	@RequestMapping("/group/selectGroupDetailProc")
	@ResponseBody
	public Map<String, Object> selectGroupDetailProc(GroupBean gBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		// TODO Service Call : 모임 고유번호 받아서 해당 모임에 대한 정보 조회
		
		// TODO 해당 모임 Bean resMap에 담아 보내기
		
		return resMap;
	}
	
	/** F : 모임 소속 회원 정보 화면 */
	@RequestMapping("/group/selectGroupMemberForm")
	public String selectGroupMemberForm() {
		return "/group/selectGroupMemberForm";
	}
	
	/** P : 모임 소속 회원 정보 조회 처리 AJAX */
	@RequestMapping("/group/selectGroupMemberProc")
	@ResponseBody
	public Map<String, Object> selectGroupMemberProc() {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		// TODO Service Call : 모임 고유번호 받아서 해당 모임의 소속 회원 정보 조회
		
		// TODO 해당 모임 소속 회원 리스트 resMap에 담아 보내기
		
		return resMap;
	}
	
	
	/** F : 새 모임 등록 화면 */
	@RequestMapping("/group/insertGroupForm")
	public String insertGroupForm() {
		return "/group/insertGroupForm";
	}
	
	/** P : 새 모임 등록 처리 */
	@RequestMapping("/group/insertGroupProc")
	public String insertGroupProc(GroupBean gBean) {
		
		// TODO Service Call : 새 모임 INSERT + 모임장 -> 내 모임 INSERT
		
		
		// TODO redirect 해도 괜찮을 듯?
		// INSERT 이후 LAST_INSERT_ID() 받아서 해당 상세페이지로 이동
		return "/group/selectGroupDetailView";
	}
	
	/** F : 모임 가입 화면 */
	@RequestMapping("/group/insertGroupMemberForm")
	public String insertGroupMemberForm() {
		return "/group/insertGroupMemberForm";
	}
	
	/** P : 모임 가입 처리 */
	@RequestMapping("/group/insertGroupMemberProc")
	public String insertGroupMemberProc(GroupBean gBean, MemberBean mBean) {
		
		// TODO Service Call : 모임 가입 : 내모임에 회원정보+모임정보 INSERT
		
		// TODO redirect 해서 해당 모임 상세정보 화면으로 이동
		// return "redirect:/group/selectGroupDetailView.do?groupNo=gBean.groupNo";
		return "/group/selectGroupDetailView";
	}
	
	/** P : 모임 구독 처리 AJAX */
	@RequestMapping("/group/insertSubsGroupProc")
	@ResponseBody
	public Map<String, Object> insertSubsGroupProc(GroupBean gBean, HttpServletRequest req) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		// 현재 로그인된 멤버 ID로 모임 구독하기
		String memberId = (String)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		// 테스트용 로그인 아이디
		memberId = "adminju";
		
		// TODO Service Call : 멤버 ID+모임 번호 받아서 모임 구독 처리하기
		
		// TODO AJAX로 돌아가서, 성공 시 UI를 모임 구독 중이라는 표시로 변경해주기
		return resMap;
	}
	
	
}
