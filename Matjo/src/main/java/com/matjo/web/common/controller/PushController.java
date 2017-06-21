package com.matjo.web.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.Constants;
import com.matjo.web.common.FCMSender;
import com.matjo.web.common.bean.PushMsgBean;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.group.service.GroupService;
import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.member.service.MemberService;

@Controller
public class PushController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private GroupService groupService;
	
	/**
	 * 특정 대상에게 보내는 푸시알림
	 * @param mBean 대상자의 ID 값, 토큰을 찾는데 사용된다.
	 * @param pushType 푸시알림의 형식. 0:모임가입신청, 1:모임가입승인, 2:모임가입반려
	 * @return 푸시메시지 전송결과 반환
	 */
	@RequestMapping("/push/sendPush")
	@ResponseBody
	public Map<String, Object> sendPush(MemberBean mBean, @RequestParam("pushType") String pushType) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "푸시 발송 실패");
		
		try {
			if (StringUtils.isEmpty(mBean.getMemberId()) ) {
				resMap.put(Constants.RESULT_MSG, "MemberID 가 누락 되었습니다.");
				return resMap;
			}
			
			MemberBean toMemberBean = memberService.selectMember(mBean);
			PushMsgBean msgBean = new PushMsgBean();
			msgBean.setTo(toMemberBean.getMemberToken());
			PushMsgBean.Data data = new PushMsgBean.Data();
			data.setTitle("테스트 제목이다. 받아라");
			data.setMessage("테스트 내용이다. 받아라");
			
			if ("1".equals(pushType)) {
				data.setTitle("모임 가입 신청 알림");
				data.setMessage("확인 후 수락 또는 거절해주세요.");
			} else if ("2".equals(pushType)) {
				data.setTitle("모임 가입");
				data.setMessage("모임 가입 신청이 승인되었습니다.");
			} else if ("3".equals(pushType)) {
				data.setTitle("모임 가입");
				data.setMessage("모임 가입 신청이 반려되었습니다.");
			}
			
			msgBean.setData(data);
			
			boolean resBool = FCMSender.sendPushMsgBean(msgBean);
			
			if (resBool) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "푸시 발송 성공 - 대상: " + mBean.getMemberId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
	
	
	/**
	 * 특정 대상에게 보내는 푸시알림
	 * @param gBean 대상자의 ID 값, 토큰을 찾는데 사용된다.
	 * @param pushType 푸시알림의 형식. 0:모임가입신청, 1:모임가입승인, 2:모임가입반려
	 * @return 푸시메시지 전송결과 반환
	 */
	@RequestMapping("/push/sendPushToGroup")
	@ResponseBody
	public Map<String, Object> sendPush(GroupBean gBean, @RequestParam("pushType") String pushType) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "푸시 발송 실패");
		
		try {
			if (StringUtils.isEmpty(gBean.getGroupNo()) ) {
				resMap.put(Constants.RESULT_MSG, "GroupID 가 누락 되었습니다.");
				return resMap;
			}
			
			
			List<MemberBean> memberList = groupService.selectGroupMember(gBean);
			List<PushMsgBean> msgBeanList = new ArrayList<PushMsgBean>();
			
			for (int i = 0; i < memberList.size(); i++) {
				// 대상의 토큰값을 알아내기 위해 멤버빈을 조회해온다.
				MemberBean toMemberBean = memberService.selectMember(memberList.get(i));
				
				// 푸시메시지빈 작성
				PushMsgBean msgBean = new PushMsgBean();
				String token = (toMemberBean.getMemberToken() == null) ? "" : toMemberBean.getMemberToken();
				msgBean.setTo(token); // 수신자 지정
				
				// 데이터 생성
				PushMsgBean.Data data = new PushMsgBean.Data();
				data.setTitle("테스트 제목이다. 받아라");
				data.setMessage("테스트 내용이다. 받아라");
				
				if ("3".equals(pushType)) {
					data.setTitle("모임리뷰 등록 알림");
					data.setMessage("모임장이 새로운 모임리뷰를 등록하였습니다.");
				} else if ("4".equals(pushType)) {
					data.setTitle("개인리뷰 등록알림");
					data.setMessage("모임원이 새로운 개인리뷰를 등록하였습니다.");
				}
				
				msgBean.setData(data); // 데이터 지정
				msgBeanList.add(msgBean);
				/* 과정을 반복 */
				
			} // end of for
			
			// 성공 갯수가 반환됨
			int resCount = FCMSender.sendPushMsgBeanList(msgBeanList);
			
			if (resCount > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "푸시 발송 성공: " + resCount + "/" + memberList.size());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
	
	
	/**
	 * 사용자의 토큰 값을 받아서 정보를 업데이트 해준다.
	 * @return
	 */
	@RequestMapping("push/updatePushToken")
	@ResponseBody
	public Map<String, Object> updatePushToken(MemberBean mBean) {
		
		// 받아야 되는 정보 ?
		// 안드로이드가 정보전송 --> token, id ===> member 테이블 갱신 (70%)
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "토큰정보 업데이트 실패");
		
		try {
			int res = memberService.updateMember(mBean);
			if (res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "토큰정보 업데이트 성공");
				resMap.put("mBean", mBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	} // end of updatePushToken
	
	@RequestMapping("/test/sendPush")
	@ResponseBody
	public Map<String, Object> sendPushTest(MemberBean mBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "푸시 발송 실패");
		
		try {
			if (StringUtils.isEmpty(mBean.getMemberId()) ) {
				resMap.put(Constants.RESULT_MSG, "MemberID 가 누락 되었습니다.");
				return resMap;
			}
			
			MemberBean toMemberBean = memberService.selectMember(mBean);
			PushMsgBean msgBean = new PushMsgBean();
			msgBean.setTo(toMemberBean.getMemberToken());
			PushMsgBean.Data data = new PushMsgBean.Data();
			data.setTitle("테스트 제목이다. 받아라");
			data.setMessage("테스트 내용이다. 받아라");
			msgBean.setData(data);
			
			boolean resBool = FCMSender.sendPushMsgBean(msgBean);
			
			if (resBool) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "푸시 발송 성공 - 대상: " + mBean.getMemberId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
}
