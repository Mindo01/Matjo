package com.matjo.web.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.matjo.web.common.bean.PagingBean;
import com.matjo.web.notice.bean.NoticeBean;
import com.matjo.web.notice.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	//공지사항 1건 조회
	@Override
	public NoticeBean selectNotice(NoticeBean noticeBean) {
		return noticeDao.selectNotice(noticeBean);
	}
	//공지사항 상세보기
	@Override
	public NoticeBean selectNoticeInfo(PagingBean pagingBean) 
	{
		
		NoticeBean bb = new NoticeBean( pagingBean.getNoticeNo(), null );
		NoticeBean noticeBean = selectNotice(bb);
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("noticeBean", noticeBean);
		
		return noticeBean;
	}
	@Override
	public List<NoticeBean> selectNoticeList(PagingBean pagingBean) {
		return null;
	}
	//공지사항 작성/등록
	@Override
	public int insertNotice(NoticeBean noticeBean) {
	
		int resVal1 = noticeDao.insertNotice(noticeBean);
		if(resVal1 <= 0) return 0; //insert실패
		
		noticeBean.setMemberId("jihye");
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("noticeBean", noticeBean);
		return resVal1;
	}
	//공지사항 수정
	@Override
	public int noticeUpdate(NoticeBean noticeBean) {
		return noticeDao.noticeUpdate(noticeBean);
	}
	
	//공지사항 삭제
	@Override
	public int noticeDelete(NoticeBean noticeBean) {
		return noticeDao.noticeDelete(noticeBean);
	}
	
	//공지사항 조회수
	@Override
	public int noticeCount(NoticeBean noticeBean) {
		return noticeDao.noticeCount(noticeBean);
	}
	
	
//	/**게시글 조회수 증가**/
//	public int updateReadCount(String seq)throws DataAccessException{
//		
//		String sql = " update notice02 set readcount = nvl(readcount,0)+1 where seq = ?";
//		Object[] obj = {seq};
//		return noticeDao.updateCnt(sql,obj);
//	}
//	
}
