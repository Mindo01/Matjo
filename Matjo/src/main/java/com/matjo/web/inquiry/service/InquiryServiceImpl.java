package com.matjo.web.inquiry.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.inquiry.bean.InquiryBean;
import com.matjo.web.inquiry.dao.InquiryDao;

@Service
public class InquiryServiceImpl implements InquiryService {

		@Autowired
		private InquiryDao inquiryDao;
		
		
		//게시글 상세보기
		@Override
		public InquiryBean selectInquiryInfo(InquiryBean inquiryBean){
			InquiryBean bb = new InquiryBean( inquiryBean.getInquiryNo(), null );
			InquiryBean inquiry = inquiryDao.selectInquiry(bb);
			
			Map<String, Object> resMap = new HashMap<String, Object>();
			resMap.put("inquiryBean", inquiryBean);
			return inquiry;
		}
		

		//게시글 작성 insert
		@Override
		public int inquiryInsert(InquiryBean inquiryBean) {
			int resVal1 = inquiryDao.inquiryInsert(inquiryBean);
			if(resVal1 <= 0) return 0; //insert실패
			
			inquiryBean.setInquiryMember("jihye");
			if(resVal1>0){
				Map<String, Object> resMap = new HashMap<String, Object>();
				resMap.put("inquiryBean", inquiryBean);
			}
			return resVal1;
		}
	
		//게시글 전체 레코드 수
		@Override
		public int selectInquiryListTotalCount(PagingBean pagingBean) {
			return inquiryDao.selectInquiryListTotalCount(pagingBean);
		}
	
		//게시글 1 건 조회
		@Override
		public List<InquiryBean> selectInquiryList(PagingBean pagingBean) {
			return inquiryDao.selectInquiryList(pagingBean);
		}
		
		//게시글 수정
		@Override
		public int inquiryUpdate(InquiryBean inquiryBean) {
			return inquiryDao.inquiryUpdate(inquiryBean);
		}
		
		//게시글 삭제
		@Override
		public int inquiryDelete(InquiryBean inquiryBean) {
			return inquiryDao.inquiryDelete(inquiryBean);
		}
		
		//게시글 조회수
		@Override
		public int inquiryCount(InquiryBean inquiryBean) {
			return inquiryDao.inquiryCount(inquiryBean);
		}
		
		//게시글 댓글
		@Override
		public InquiryBean inquiryReplyInsert(InquiryBean inquiryBean) {
			// 댓글 수정
			int res = inquiryDao.inquiryReplyInsert(inquiryBean);
			if(res>0){
				// 성공하면 해당 게시글 번호 받아서 1건 조회
				InquiryBean inquiry = inquiryDao.selectInquiryInfo(inquiryBean);
				return inquiry;
			}else{
				return null;
			}
		}

}
