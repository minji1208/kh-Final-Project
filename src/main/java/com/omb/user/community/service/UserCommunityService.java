package com.omb.user.community.service;

import java.util.List;

import com.omb.user.community.vo.UserCommunityVO;

public interface UserCommunityService {
	
	public List<UserCommunityVO> communityList(UserCommunityVO community);	// 매개변수로 카테고리를 전달받아 각각 조회
	
	public int communityListCnt(UserCommunityVO community);	// 총 레코드 수
	
	public UserCommunityVO communityDetail(UserCommunityVO community);	// 상세 조회
	
	public int updateCommunityCnt(UserCommunityVO community);	// 조회수 증가
	
	public int insertCommunity(UserCommunityVO community) throws Exception;		// 게시글 등록
	
	public int updateCommunity(UserCommunityVO community) throws Exception;		// 게시글 수정
	
	public int deleteCommunity(UserCommunityVO community) throws Exception;		// 게시글 삭제
	
	
	
	
	/* 민석 작업 */
	
	public List<UserCommunityVO> myPageCommunityList(UserCommunityVO community);	// 마이페이지 조회
	
	public int myPageCommunityListCnt(UserCommunityVO community);	// 마이페이지 총 레코드 수

}
