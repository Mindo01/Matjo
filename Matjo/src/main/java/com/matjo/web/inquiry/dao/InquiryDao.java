package com.matjo.web.inquiry.dao;

import java.util.List;

import java.util.Map;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.inquiry.bean.InquiryBean;

public interface InquiryDao {

	/** 게시판를 조회해서 가져온다. **/
	public InquiryBean selectInquiry(InquiryBean inquiryBean);
	
	/** 게시판를 조회해서 리스트로 가져온다. **/
	public List<InquiryBean> selectInquiryList(PagingBean pagingBean);
	
	/** 전체 레코드 갯수**/
	public int selectInquiryListTotalCount(PagingBean pagingBean);
	
	/** 게시판 게시글 저장 **/
	public int inquiryInsert(InquiryBean inquiryBean);

	/**게시글 상세보기**/
	public InquiryBean selectInquiryInfo(InquiryBean inquiryBean);
	
	/**게시글 수정하기**/
	public int inquiryUpdate(InquiryBean inquiryBean);
		
	/**게시글 삭제하기**/
	public int inquiryDelete(InquiryBean inquiryBean);
		
	/**게시글 조회수**/
	public int inquiryCount(InquiryBean inquiryBean);
	
	/**게시글 갯수/여부**/
	public int inquiryReplyInsert(InquiryBean inquiryBean);
	
}
