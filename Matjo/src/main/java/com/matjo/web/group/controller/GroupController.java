package com.matjo.web.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.matjo.web.common.Constants;
import com.matjo.web.common.Util;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.group.service.GroupService;
import com.matjo.web.member.bean.MemberBean;

@Controller
public class GroupController {
	
	// 이미지 파일 업로드 경로
	@Value("#{config['file.upload.path']}")
	private String FILE_UPLOAD_PATH;
	
	@Autowired
	GroupService groupService;
	
	/** F : 모임 정보 화면 */
	@RequestMapping("/group/selectGroupDetailView")
	public String selectGroupDetailView(GroupBean gBean, Model model) {
		model.addAttribute("gBean", gBean);
		return "/group/selectGroupDetailView";
	}
	
	/** P : 모임 정보 조회 처리 AJAX 
	 * @param gBean groupNo 넘김
	 * @return
	 */
	@RequestMapping("/group/selectGroupDetailProc")
	@ResponseBody
	public Map<String, Object> selectGroupDetailProc(GroupBean gBean) {
		// Service Call : 모임 고유번호 받아서 해당 모임에 대한 정보 조회
		return groupService.selectGroupDetail(gBean);
	}
	
	/** F : 모임 목록 화면 */
	@RequestMapping("/group/selectGroupList")
	public String selectGroupList() {
		return "/group/selectGroupList";
	}
	
	/** F : 모임 소속 회원 정보 화면 */
	@RequestMapping("/group/selectGroupMemberForm")
	public String selectGroupMemberForm() {
		return "/group/selectGroupMemberForm";
	}
	
	/** P : 모임 소속 회원 정보 조회 처리 AJAX */
	@RequestMapping("/group/selectGroupMemberProc")
	@ResponseBody
	public Map<String, Object> selectGroupMemberProc(GroupBean gBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "모임 소속 회원목록 조회에 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		
		// Service Call : 모임 고유번호 받아서 해당 모임의 소속 회원 정보 조회
		List<MemberBean> memberList = groupService.selectGroupMember(gBean);
		if (memberList != null && memberList.size() > 0) {
			// 해당 모임 소속 회원 리스트 resMap에 담아 보내기
			resMap.put("memberList", memberList);
			// 성공 설정
			resMap.put(Constants.RESULT_MSG, "모임 소속 회원목록 조회에 성공했습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		}
		return resMap;
	}
	
	
	/** F : 새 모임 등록 화면 */
	@RequestMapping("/group/insertGroupForm")
	public String insertGroupForm() {
		return "/group/insertGroupForm";
	}
	
	/** P : 새 모임 등록 처리 */
	@RequestMapping("/group/insertGroupProc")
	public String insertGroupProc(GroupBean gBean, Model model,
				@RequestParam("imgFile") MultipartFile[] imgFile) {
		
		// 이미지 프로필 파일 저장하기
		if (imgFile != null) {
			// TODO cafe24서버에 프로젝트 업로드 시, 이미지 저장하는 경로 (config.properties) 변경하기
			String imgPath = "";
			try {
				imgPath = Util.uploadFileMng(imgFile[0], FILE_UPLOAD_PATH);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (imgPath != null && !imgPath.equals("")) {
				gBean.setGroupImg(imgPath);
			}
		}
		
		// Service Call : 새 모임 INSERT + 모임장 -> 내 모임 INSERT
		int res = groupService.insertGroup(gBean);
		if (res > 0) {
			// TODO redirect 해도 괜찮을 듯?
			// INSERT 이후 LAST_INSERT_ID() 받아서 해당 상세페이지로 이동
			//GroupBean bean = groupService.selectGroupDetail(gBean);
			model.addAttribute("gBean", gBean);
			return "/group/selectGroupDetailView";
		}
		return "/group/insertGroupForm";
	}
	
	/** F : 모임 가입 화면 */
	@RequestMapping("/group/insertGroupMemberForm")
	public String insertGroupMemberForm() {
		return "/group/insertGroupMemberForm";
	}
	
	/** P : 모임 가입 처리 */
	@RequestMapping("/group/insertGroupMemberProc")
	public String insertGroupMemberProc(GroupBean gBean, MemberBean mBean,
								HttpServletRequest req, Model model) {
		// 모임 가입할 회원 정보 받아오기
		String memberNo = mBean.getMemberNo();
		// 로그인한 상태라면 세션에서 로그인한 정보의 No 가져오기
		MemberBean memberLoginBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		if (memberLoginBean != null) {
			memberNo = memberLoginBean.getMemberNo();
		}
		// gBean에 설정해주기
		gBean.setMemberNo(memberNo);
		
		// Service Call : 모임 가입 : 내모임에 회원정보+모임정보 INSERT
		int res = groupService.insertGroupApply(gBean);	// TODO 아직 ServiceImpl 안건드렸음! 확인 필요!
		if (res > 0) {
			// 성공
			// TODO redirect 해서 해당 모임 상세정보 화면으로 이동
			// return "redirect:/group/selectGroupDetailView.do?groupNo=gBean.groupNo";
		}
		
		// 실패 : 원래 페이지로 돌아가기
		model.addAttribute("groupNo", gBean.getGroupNo());
		return "/group/selectGroupDetailView";
	}
	
	/** P : 모임 구독 처리 AJAX */
	@RequestMapping("/group/insertSubsGroupProc")
	@ResponseBody
	public Map<String, Object> insertSubsGroupProc(GroupBean gBean, HttpServletRequest req) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		// 현재 로그인된 멤버 ID로 모임 구독하기
		MemberBean mBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		
		// TODO Service Call : 멤버 ID+모임 번호 받아서 모임 구독 처리하기
		
		// TODO AJAX로 돌아가서, 성공 시 UI를 모임 구독 중이라는 표시로 변경해주기
		return resMap;
	}
	
}
