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
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.group.bean.GroupBean;
import com.matjo.web.group.service.GroupService;
import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.review.bean.ReviewBean;
import com.matjo.web.review.service.ReviewService;

@Controller
public class GroupController {
	
	// 이미지 파일 업로드 경로
	@Value("#{config['file.upload.path']}")
	private String FILE_UPLOAD_PATH;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private ReviewService reviewService;
	
	/** F : 모임 정보 화면 */
	@RequestMapping("/group/selectGroupDetailView")
	public String selectGroupDetailView(GroupBean gBean, Model model) {
		model.addAttribute("gBean", gBean);
		return "/group/selectGroupDetailView";
	}
	
	/** P : 모임 정보 조회 처리 AngularJS
	 * @param gBean groupNo 넘김
	 * @return
	 */
	@RequestMapping("/group/selectGroupDetailProc")
	@ResponseBody
	public Map<String, Object> selectGroupDetailProc(GroupBean gBean, HttpServletRequest req) {
		Map<String, Object> resMap;
		// 리뷰 검색에 이용할 리뷰빈 생성
		ReviewBean rBean = new ReviewBean();
		
		// 현재 로그인한 회원 정보 넘기기
		MemberBean mBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		if (mBean != null) {
			gBean.setMemberNo(mBean.getMemberNo());
			// 리뷰빈에 현재 보고 있는 로그인 아이디 설정 (좋아요 검색용)
			rBean.setReviewNowMember(mBean.getMemberNo());
		}
		// Service Call : 모임 고유번호 받아서 해당 모임에 대한 정보 조회
		resMap = groupService.selectGroupDetail(gBean);
		
		// 리뷰빈에 모임번호 설정해 넘기기
		rBean.setReviewGroupNo(gBean.getGroupNo());
		
		// Service Call : 모임 기준 리뷰 목록 조회
		List<ReviewBean> reviewList = reviewService.selectReviewPereviewListForGroup(rBean);
		resMap.put("reviewList", reviewList);
		return resMap;
	}
	
	/** F : 모임 목록 화면 */
	@RequestMapping("/group/selectGroupList")
	public String selectGroupList() {
		return "/group/selectGroupList";
	}
	
	/** P : 모임 목록 처리 AJAX */
	@RequestMapping("/group/selectGroupListProc")
	@ResponseBody
	public Map<String, Object> selectGroupListProc(PagingBean pBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "모임 목록 조회에 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		
		// Service Call : 검색 조건과 값 받아서 모임 전체 조회 (검색 조건과 값이 없으면 전체 조회)
		List<GroupBean> gList = groupService.selectGroupList(pBean);
		
		resMap.put("pBean", pBean);
		
		if (gList != null && gList.size() > 0 /* 조회가 성공적일 때 */) {
			resMap.put("gList", gList);
			// 성공 설정
			resMap.put(Constants.RESULT_MSG, "모임 목록 조회에 성공했습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		} else if (gList.size() == 0) {
			resMap.put(Constants.RESULT, "해당하는 모임이 존재하지 않습니다");
		}
		
		return resMap;
	}
	
	/** F : 모임 소속 회원 정보 화면 */
	@RequestMapping("/group/selectGroupMemberList")
	public String selectGroupMemberList(GroupBean gBean, Model model) {
		model.addAttribute("gBean", gBean);
		return "/group/selectGroupMemberList";
	}
	
	/** P : 모임 소속 회원 정보 조회 처리 AngularJS */
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
		resMap.put("gBean", gBean);
		return resMap;
	}
	
	
	/** F : (임시) 새 모임 등록 화면 */
	@RequestMapping("/group/insertGroupForm")
	public String insertGroupForm() {
		return "/group/insertGroupForm";
	}
	
	/** P : 새 모임 등록 처리 */
	@RequestMapping("/group/insertGroupProc")
	public String insertGroupProc(GroupBean gBean, Model model,
				@RequestParam("imgFile") MultipartFile[] imgFile) {
		
		// 유효성 1 : 모임명이 비어있는지 확인
		if (gBean != null && (gBean.getGroupName() == null || gBean.getGroupName().length() <= 0)) {
			// 모임명을 작성하세요!
			model.addAttribute("gBean", gBean);
			model.addAttribute(Constants.RESULT_MSG, "모임명을 입력하세요!");
			return "/group/insertGroupForm";
		}
		
		// 유효성 2 : 이미 존재하는 '모임명'인지 확인
		int res1 = groupService.selectGroupByName(gBean);
		if (res1 >= 1) {
			// 존재함
			model.addAttribute("gBean", gBean);
			model.addAttribute(Constants.RESULT_MSG, "이미 존재하는 모임명입니다");
			return "/group/insertGroupForm";
		}
		
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
	
	/** F : (임시) 모임 가입 화면 */
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
		int res = groupService.insertGroupApply(gBean);
		if (res > 0) {
			// 성공
			model.addAttribute("gBean", gBean);
			return "/group/selectGroupDetailView";
		}
		// 실패 : 다시 작성 폼으로 돌아가기
		model.addAttribute("gBean", gBean);
		if (res == -1) {
			model.addAttribute(Constants.RESULT_MSG, "모임에 이미 가입 신청 중이거나, 가입된 회원입니다");
		}
		return "/group/insertGroupMemberForm";
		
	}
	
	/** F-2 : (임시) 모임 가입 자식창 - 가입할 모임 검색 */
	@RequestMapping("/group/selectGroupToApply")
	public String selectGroupToApply() {
		return "/group/selectGroupToApply";
	}
	
	/** P-2 : 모임 가입 자식창 - 가입할 모임 검색 AJAX */
	@RequestMapping("/group/selectGroupToApplyProc")
	@ResponseBody
	public Map<String, Object> selectGroupToApplyProc(PagingBean pBean) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "모임 목록 조회에 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		
		// Service Call : 검색 조건과 값 받아서 모임 전체 조회 (검색 조건과 값이 없으면 전체 조회)
		List<GroupBean> gList = groupService.selectGroupToApply(pBean);
		
		resMap.put("pBean", pBean);
		
		if (gList != null && gList.size() > 0 /* 조회가 성공적일 때 */) {
			resMap.put("gList", gList);
			// 성공 설정
			resMap.put(Constants.RESULT_MSG, "모임 목록 조회에 성공했습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		} else if (gList.size() == 0) {
			resMap.put(Constants.RESULT_MSG, "해당하는 모임이 존재하지 않습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		}
		
		return resMap;
	}
	
	/** P : 모임 구독 처리 AngularJS */
	@RequestMapping("/group/insertSubsGroupProc")
	@ResponseBody
	public Map<String, Object> insertSubsGroupProc(GroupBean gBean, HttpServletRequest req) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "모임 구독을 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		gBean.setHasSubsGroup("false");
		
		// 현재 로그인된 멤버 ID로 모임 구독하기
		MemberBean mBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		gBean.setMemberNo(mBean.getMemberNo());
		
		// Service Call : 멤버 ID+모임 번호 받아서 모임 구독 처리하기
		int res = groupService.insertSubsGroup(gBean);
		if (res > 0) {
			// 성공 설정
			gBean.setHasSubsGroup("true");
			resMap.put(Constants.RESULT_MSG, "모임 구독을 성공했습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		}
		resMap.put("gBean", gBean);
		// 원래 페이지로 돌아가서, 성공 시 UI를 모임 구독 중이라는 표시로 변경해주기
		return resMap;
	}
	
	/** P : 모임 구독 해제 처리 AngularJS */
	@RequestMapping("/group/deleteSubsGroupProc")
	@ResponseBody
	public Map<String, Object> deleteSubsGroupProc(GroupBean gBean, HttpServletRequest req) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "모임 구독 해제를 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		gBean.setHasSubsGroup("true");
		
		// 현재 로그인된 멤버 ID로 모임 구독하기
		MemberBean mBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		gBean.setMemberNo(mBean.getMemberNo());
		
		// Service Call : 멤버 ID+모임 번호 받아서 모임 구독 해제 처리하기
		int res = groupService.deleteSubsGroup(gBean);
		if (res > 0) {
			// 성공 설정
			gBean.setHasSubsGroup("false");
			resMap.put(Constants.RESULT_MSG, "모임 구독 해제를 성공했습니다");
			resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
		}
		resMap.put("gBean", gBean);
		// 원래 페이지로 돌아가서, 성공 시 UI를 모임 구독 해제되어있는 표시로 변경해주기
		return resMap;
	}
	
	/** F : (임시) 내 구독 모임 보기 */
	@RequestMapping("/group/selectSubsGroupForm")
	public String selectSubsGroupForm() {
		return "/group/selectSubsGroupForm";
	}
	
	/** P : 내 구독 모임 조회 */
	@RequestMapping("/group/selectSubsGroupProc")
	@ResponseBody
	public Map<String, Object> selectSubsGroupProc(HttpServletRequest req) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		// 기본 설정 : 실패
		resMap.put(Constants.RESULT_MSG, "내 구독모임 조회를 실패했습니다");
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		// 멤버빈에 회원정보 넣어주기
		MemberBean mBean = (MemberBean)req.getSession().getAttribute(Constants.MEMBER_LOGIN_BEAN);
		mBean.setMemberNo(mBean.getMemberNo());
		if (mBean != null) {
			// Service Call : 멤버ID 받아서 구독한 모임들 조회하기
			List<GroupBean> groupList = groupService.selectSubsGroup(mBean);
			if (groupList != null) {
				// 성공 설정
				resMap.put(Constants.RESULT_MSG, "모임 구독 해제를 성공했습니다");
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
			}
			resMap.put("groupList", groupList);
		}
		return resMap;
	}
	
	/** 모임장 조회 (리뷰 등록 시 모임장인지 체크할 때) **/
	@RequestMapping("/android/checkLeaderProc")
	@ResponseBody
	public Map<String, Object> checkLeaderProc(GroupBean gBean) {
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "모임장 조회에 실패 하였습니다.");
		
		try {
			List<GroupBean> groupList = groupService.checkLeader(gBean);
			if (groupList != null) {
				resMap.put("list", groupList);
				resMap.put(Constants.RESULT, Constants.RESULT_SUCCESS);
				resMap.put(Constants.RESULT_MSG, "모임장 조회에 성공 하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}
	
}
