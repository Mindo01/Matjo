package com.matjo.web.inquiry.controller;

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
import com.matjo.web.inquiry.bean.InquiryBean;
import com.matjo.web.inquiry.dao.InquiryDao;
import com.matjo.web.inquiry.service.InquiryService;
import com.matjo.web.member.bean.MemberBean;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private InquiryDao inquiryDao;
	
	@RequestMapping("/inquiry/selectInquiryDetail")
	public String selectInquiryDetail(){
		return "/inquiry/selectInquiryDetail";
	}
	//게시글 상세보기
	@RequestMapping("/inquiry/inquiryDetailViewProc")
	@ResponseBody
	public Map<String, Object> inquiryDetailViewProc(InquiryBean inquiryBean, HttpServletRequest req) {

		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
		resMap.put(Constants.RESULT_MSG, "게시글 상세보기 조회 실패");
		
		InquiryBean inquiry = inquiryDao.selectInquiryInfo(inquiryBean);
		
		req.getSession().setAttribute("inquiryBean", inquiry);
		
		Integer inquiryCount = inquiryDao.inquiryCount(inquiry);
		try {
			resMap.put("inquiryBean", inquiry);
			resMap.put("inquiryCount", inquiryCount);
			resMap.put(Constants.RESULT, Constants.RESULT_OK);
			resMap.put(Constants.RESULT_MSG, "게시글 상세보기 조회 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return resMap;
	}
	
	
	//게시글 작성
		@RequestMapping("/inquiry/insertInquiryForm")
		public String insertInquiryForm() {
			return "/inquiry/insertInquiryForm";
		}
		
		@RequestMapping("/inquiry/inquiryInsertProcAjax")
		@ResponseBody
		public Map<String, Object> inquiryInsertProcAjax(
				InquiryBean inquiryBean,HttpServletRequest req) 
		{
			Map<String, Object> resMap = new HashMap<String, Object>();
			resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
			resMap.put(Constants.RESULT_MSG, "게시글 작성 실패");

			try {
				
				MemberBean memberBean = 
					(MemberBean)req.getSession()
					.getAttribute(Constants.MEMBER_LOGIN_BEAN);
				if(memberBean != null) {
					inquiryBean.setMemberId( memberBean.getMemberId() );
				}
				int res = inquiryService.inquiryInsert(inquiryBean);
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
		@RequestMapping("/inquiry/selectInquiryList")
		public String selectInquiryList(Model model, PagingBean pagingBean) {
		
			
		//전체 레코드 갯수 취득
		int totRecord = inquiryDao.selectInquiryListTotalCount(pagingBean);
		//페이징 계산
		pagingBean.calcPage(totRecord);
		
		List<InquiryBean> list = inquiryDao.selectInquiryList(pagingBean);
		model.addAttribute("inquiryList", list);
		model.addAttribute("pBean", pagingBean);
		return "/inquiry/selectInquiryList";
	}
	
	//게시글 수정
		@RequestMapping("/inquiry/updateInquiryForm")
		public String updateInquiryForm() {
			return "/inquiry/updateInquiryForm";
		}
		@RequestMapping("/inquiry/inquiryUpdateProc")
		@ResponseBody
		public Map<String, Object> inquiryUpdateProc(InquiryBean inquiryBean, HttpServletRequest req){
			Map<String, Object> resMap = new HashMap<String, Object>();

			resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
			resMap.put(Constants.RESULT_MSG, "게시글 수정에 실패하였습니다.");
			
			try {
				// DB update
//				InquiryBean nBean = (InquiryBean) req.getSession().getAttribute("inquiryBean");
//				inquiryBean.setInquiryNo(nBean.getInquiryNo());
				int res = inquiryDao.inquiryUpdate(inquiryBean); 
				
				if(res > 0) {
					
					resMap.put(Constants.RESULT, Constants.RESULT_OK);
					resMap.put(Constants.RESULT_MSG, "게시글 수정에 성공하였습니다.");
					resMap.put("inquiryBean", inquiryBean);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return resMap;
		}
		
		
		//게시글 삭제
		@RequestMapping("/inquiry/inquiryDelete")
		public String inquiryDelete() {
			return "/inquiry/inquiryDelete";
		}
		@RequestMapping("/inquiry/inquiryDeleteProc")
		@ResponseBody
		public Map<String, Object> inquiryDeleteProc(InquiryBean inquiryBean, HttpServletRequest req){
			Map<String, Object> resMap = new HashMap<String, Object>();
			resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
			resMap.put(Constants.RESULT_MSG, "게시글 삭제에 실패하였습니다.");
			
			try {
					int res = inquiryDao.inquiryDelete(inquiryBean);
					if(res > 0) {
						resMap.put(Constants.RESULT, Constants.RESULT_OK);
						resMap.put(Constants.RESULT_MSG, "게시글 삭제에 성공하였습니다.");
						resMap.put("inquiryBean", inquiryBean);
					}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return resMap;
		}
		
		
		//댓글 올리기
		@RequestMapping("/inquiry/inquiryReplyProc")
		@ResponseBody
		public Map<String, Object> inquiryReplyProc(InquiryBean inquiryBean, HttpServletRequest req){
			Map<String, Object> resMap = new HashMap<String, Object>();
			
			resMap.put(Constants.RESULT, Constants.RESULT_FAIL);
			resMap.put(Constants.RESULT_MSG, "댓글 작성에 실패하였습니다.");
			
			try {
				InquiryBean inquiry = inquiryService.inquiryReplyInsert(inquiryBean);
				if(inquiry!=null) {
					resMap.put(Constants.RESULT, Constants.RESULT_OK);
					resMap.put(Constants.RESULT_MSG, "댓글 작성에 성공하였습니다.");
					resMap.put("inquiryBean", inquiry);
					}
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return resMap;
		}
}
