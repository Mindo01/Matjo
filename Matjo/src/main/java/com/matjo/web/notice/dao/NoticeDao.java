package com.matjo.web.notice.dao;

import java.util.List;
import java.util.Map;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.notice.bean.NoticeBean;

public interface NoticeDao {

	/** 게시판를 조회해서 가져온다. **/
	public NoticeBean selectNotice(NoticeBean noticeBean);
	
	/** 게시판를 조회해서 리스트로 가져온다. **/
	public List<NoticeBean> selectNoticeList(PagingBean bean);
	
	/** 전체 레코드 갯수를 가져온다. **/
	public int selectNoticeListTotalCount(PagingBean bean);
	
	//공지사항 상세보기
	public NoticeBean selectNoticeInfo(PagingBean pagingBean);
	
	 //공지사항 등록
	public int insertNotice(NoticeBean noticeBean);

	//공지사항 수정
	public int noticeUpdate(NoticeBean noticeBean);
	
	//공지사항 삭제
	public int noticeDelete(NoticeBean noticeBean);
	
	//공지사항 조회수
	public int noticeCount(NoticeBean noticeBean);
	
	
}
