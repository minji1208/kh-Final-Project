package com.omb.admin.notice.service;

import java.util.List;

import com.omb.admin.notice.vo.AdmNoticeVO;

public interface AdmNoticeService {

	public int noticeInsert(AdmNoticeVO nvo) throws Exception;
	public AdmNoticeVO noticeDetail(AdmNoticeVO nvo);
	public AdmNoticeVO noticeupdateForm(AdmNoticeVO nvo);
	public int noticeUpdate(AdmNoticeVO nvo) throws Exception;
	public int noticeDelete(AdmNoticeVO nvo) throws Exception;
	public List<AdmNoticeVO> noticeList(AdmNoticeVO nvo); /* 검색 포함 리스트 */
	public int noticeListCnt(AdmNoticeVO nvo);
	public List<AdmNoticeVO> eventList(AdmNoticeVO nvo);
}
