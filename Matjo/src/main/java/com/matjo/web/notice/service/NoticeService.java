package com.matjo.web.notice.service;

import java.util.List;
import java.util.Map;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.notice.bean.NoticeBean;

public interface NoticeService {

	//공지사항 1건 조회
	public NoticeBean selectNotice(NoticeBean noticeBean);

	//공지사항 통합조회
	public NoticeBean selectNoticeInfo(PagingBean pagingBean);

	//공지사항 리스트
	public List<NoticeBean> selectNoticeList(PagingBean pagingBean);

	//공지사항 작성
	public int insertNotice(NoticeBean noticeBean);

	//공지사항 수정
	public int noticeUpdate(NoticeBean noticeBean);

	//공지사항 삭제
	public int noticeDelete(NoticeBean noticeBean);
	
	//공지사항 조회수
	public int noticeCount(NoticeBean noticeBean);

	//전체레코드 조회
	public int selectNoticeListTotalCount(PagingBean pagingBean);
		
	
	
//	//게시글 전체리스트
//	public int selectNoticeListTotalCount(PagingBean pagingBean);

}
