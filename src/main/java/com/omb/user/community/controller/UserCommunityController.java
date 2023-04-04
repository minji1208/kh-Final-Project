package com.omb.user.community.controller;

import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.omb.common.vo.PageDTO;
import com.omb.user.community.service.UserCommunityService;
import com.omb.user.community.vo.UserCommunityVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/community/*")
@Slf4j
public class UserCommunityController {
	
	@Setter(onMethod_ = @Autowired)
	private UserCommunityService userCommunityService;

	@GetMapping("/communityList")
	public String communityList(UserCommunityVO community, Model model) {
		
		String path = "";
		log.info("communityList 메서드 호출");
		log.info("전달받은 값 : " + community.getC_category());
		log.info("1. 현재 페이지 : " + community.getPageNum());
		log.info("1. 보여줄 데이터 수 : " + community.getAmount());
		
		if(community.getC_category().equals("C")) {
			path = "user/community/communityList";
		}
		else if(community.getC_category().equals("A")) {
			path = "user/community/communityListReview";
		}
		else if(community.getC_category().equals("B")) {
			path = "user/community/communityListRecipe";
		}
		
		log.info("이동할 경로 : " + path);
		
		List<UserCommunityVO> communityList = userCommunityService.communityList(community);
		
		model.addAttribute("communityList", communityList);
		
		// 전체 레코드 수 구현 
		int total = userCommunityService.communityListCnt(community);
		log.info("전체 레코드 수 : " + total);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(community, total));
		
		return path;
	}
	
	@GetMapping("/communityDetail")
	public String communityDetail(UserCommunityVO community, Model model) {
		
		log.info("communityDetail 메서드 호출");
		log.info("전달받은 글번호 : " + community.getC_no());
		
		UserCommunityVO detail = userCommunityService.communityDetail(community);
		log.info("게시판 상세 : " + detail);
		
		model.addAttribute("detail", detail);
		
		return "user/community/communityDetail";
	}
	
	@GetMapping("/writeView")
	public String insertCommunityView(UserCommunityVO community, Model model) {
		log.info("전달받은 카테고리명 : " + community.getC_category());
		
		model.addAttribute("community", community);
		
		return "user/community/communityWriteView";
	}
	
	@PostMapping("insertCommunity")
	public String insertCommunity(UserCommunityVO community) throws Exception {
		
		log.info("입력받은 데이터 : " + community);
		
		int result = 0;
		String path = "";
		
		result = userCommunityService.insertCommunity(community);
		
		 community.setC_category(URLEncoder.encode(community.getC_category(), "UTF-8"));
		
		if(result == 1) {
			log.info("입력 성공");
			path = "/community/communityList?c_category=" + community.getC_category();
		} else {
			path = "/community/writeView";
		}
		log.info("path : " + path);
		
		return "redirect:" + path;
	}
}
