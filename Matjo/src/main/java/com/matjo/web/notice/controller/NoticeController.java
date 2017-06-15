package com.matjo.web.notice.controller;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.matjo.web.common.Constants;
import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.member.bean.MemberBean;
import com.matjo.web.notice.bean.NoticeBean;
import com.matjo.web.notice.dao.NoticeDao;
import com.matjo.web.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeDao noticeDao;
	
	//게시글 상세보기
	@RequestMapping("/notice/selectNoticeDetail")
	public String selectNoticeDetail(){
		return "/notice/selectNoticeDetail";
	}
	
	@RequestMapping("/notice/noticeDetailViewProc")
	@ResponseBody
	public Map<String, Object> noticeDetailViewProc(PagingBean pagingBean, HttpServletRequest req) {

		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 상세보기 조회 실패");

		NoticeBean noticeBean = noticeDao.selectNoticeInfo(pagingBean);
		int noticeCount = noticeDao.noticeCount(noticeBean);
		req.getSession().setAttribute("noticeBean", noticeBean);
		
		try {
			
			resMap.put("noticeBean", noticeBean);
			resMap.put("noticeCount", noticeCount);
			resMap.put(Constants.RESULT, Constants.RESULT_OK);
			resMap.put(Constants.RESULT_MSG, "게시글 상세보기 조회 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}
	
	
	//게시글 작성
	@RequestMapping("/notice/insertNoticeForm")
	public String insertNoticeForm() {
		return "/notice/insertNoticeForm";
	}
	@RequestMapping("/notice/noticeInsertProcAjax")
	@ResponseBody
	public Map<String, Object> noticeInsertProcAjax(
			NoticeBean noticeBean,HttpServletRequest req) 
	{
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 작성 실패");

		try {
			
			MemberBean memberBean = 
				(MemberBean)req.getSession()
				.getAttribute(Constants.MEMBER_LOGIN_BEAN);
			if(memberBean != null) {
				noticeBean.setMemberId( memberBean.getMemberId() );
			}
			int res = noticeService.insertNotice(noticeBean);
			if(res > 0) {
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "게시글 작성 성공");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return resMap;
	}

	//게시글 리스트
	@RequestMapping("/notice/selectNoticeList")
	public String selectNoticeList(Model model, PagingBean pagingBean) {
		//전체 레코드 갯수 취득
		int totRecord = noticeDao.selectNoticeListTotalCount(pagingBean);
		//페이징 계산
		pagingBean.calcPage(totRecord);
		
		List<NoticeBean> list = noticeDao.selectNoticeList(pagingBean);
		model.addAttribute("noticeList", list);
		model.addAttribute("pBean", pagingBean);
		return "/notice/selectNoticeList";
	}
	//게시글 수정
	@RequestMapping("/notice/updateNoticeForm")
	public String updateNoticeForm() {
		return "/notice/updateNoticeForm";
	}
	@RequestMapping("/notice/noticeUpdateProc")
	@ResponseBody
	public Map<String, Object> noticeUpdateProc(NoticeBean noticeBean, HttpServletRequest req){
		Map<String, Object> resMap = new HashMap<String, Object>();

		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 수정에 실패하였습니다.");
		
		try {
			// DB update
//			NoticeBean nBean = (NoticeBean) req.getSession().getAttribute("noticeBean");
//			noticeBean.setNoticeNo(nBean.getNoticeNo());
			int res = noticeDao.noticeUpdate(noticeBean); 
			
			if(res > 0) {
				
				resMap.put(Constants.RESULT, Constants.RESULT_OK);
				resMap.put(Constants.RESULT_MSG, "게시글 수정에 성공하였습니다.");
				resMap.put("noticeBean", noticeBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return resMap;
	}
	
	
	//게시글 삭제
	@RequestMapping("/notice/noticeDelete")
	public String noticeDelete() {
		return "/notice/noticeDelete";
	}
	@RequestMapping("/notice/noticeDeleteProc")
	@ResponseBody
	public Map<String, Object> noticeDeleteProc(NoticeBean noticeBean, HttpServletRequest req){
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 삭제에 실패하였습니다.");
		
		try {
			
				int res = noticeDao.noticeDelete(noticeBean);
				if(res > 0) {
					resMap.put(Constants.RESULT, Constants.RESULT_OK);
					resMap.put(Constants.RESULT_MSG, "게시글 삭제에 성공하였습니다.");
					resMap.put("noticeBean", noticeBean);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return resMap;
	}
		
}
