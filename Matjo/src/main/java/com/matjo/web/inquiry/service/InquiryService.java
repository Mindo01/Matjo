package com.matjo.web.inquiry.service;

import java.util.List;
import java.util.Map;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.inquiry.bean.InquiryBean;

public interface InquiryService {

	//게시글 상세보기
	public InquiryBean selectInquiryInfo(InquiryBean inquiryBean);

	//게시글 전체 레코드 수 조회
	public int selectInquiryListTotalCount(PagingBean pagingBean);

	//게시글 리스트로 보이기
	public List<InquiryBean> selectInquiryList(PagingBean pagingBean);

	//게시글 작성
	public int inquiryInsert(InquiryBean inquiryBean);
	
	//게시글 수정
	public int inquiryUpdate(InquiryBean inquiryBean);
		
	//게시글 삭제
	public int inquiryDelete(InquiryBean inquiryBean);
		
	//게시글 조회수
	public int inquiryCount(InquiryBean inquiryBean);
	
	//게시글 댓글
	public InquiryBean inquiryReplyInsert(InquiryBean inquiryBean);
	
	
}
