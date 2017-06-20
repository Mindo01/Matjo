package com.matjo.web.common.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.Constants;
import com.matjo.web.common.FCMSender;
import com.matjo.web.common.bean.PushMsgBean;
import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.member.service.MemberService;

@Controller
public class PushController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/push/sendPush")
	@ResponseBody
	public Map<String, Object> sendPush(MemberBean mBean, String pushType) {
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
