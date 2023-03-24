package com.omb.admin.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.admin.member.service.AdmMemberService;
import com.omb.admin.member.vo.AdmMemberVO;
import com.omb.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@AllArgsConstructor
@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdmMemberController {

	@Setter(onMethod_= @Autowired)
	private AdmMemberService admMemberService;
	
	
	@GetMapping("/memberList")
	public String memberList(@ModelAttribute AdmMemberVO mvo, Model model) {
		log.info("memberList 메서드 확인");
		log.info("mvo : " + mvo);
		
		List<AdmMemberVO> memberList = admMemberService.memberList(mvo);
		model.addAttribute("memberList", memberList);
		
		int total = admMemberService.memberListCnt(mvo);
		
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		
		return "admin/memberMng/memberList";
	}
	
	@GetMapping("/memberDetail")
	public String memberDetail(@ModelAttribute AdmMemberVO mvo, Model model) {
		log.info("memberDetail 메서드 확인");
		
		AdmMemberVO detail = admMemberService.memberDetail(mvo);
		model.addAttribute("detail", detail);
		
		return "admin/memberMng/memberDetail";
	}
	
	
	@GetMapping("/nmemberList")
	public String nmemberList(@ModelAttribute AdmMemberVO mvo, Model model) {
		log.info("nmemeberList 메서드 확인");
		
		List<AdmMemberVO> nmemberList = admMemberService.nmemberList(mvo);
		model.addAttribute("nmemberList", nmemberList);
		
		int total = admMemberService.nmemberListCnt(mvo);
		
		model.addAttribute("pageMaker", new PageDTO(mvo, total));
		
		return "admin/memberMng/nmemberList";
	}
	
	@GetMapping("/nmemberDetail")
	public String nmemberDetail(@ModelAttribute AdmMemberVO mvo, Model model) {
		log.info("nmemberDetail 메서드 확인");
		
		AdmMemberVO detail = admMemberService.memberDetail(mvo);
		model.addAttribute("detail", detail);
		
		return "admin/memberMng/nmemberDetail";
	}
	
	@PostMapping("/memberGrade")
	public String memberGrade(int u_num, @ModelAttribute AdmMemberVO mvo, Model model) throws Exception {
		log.info("memberGrade 메서드 확인");
		log.info("mvo : " + mvo);
		
		mvo.setU_no(u_num);
		log.info("mvo2 : " + mvo);
		
		int result = 0;
		String url="";
		
		result = admMemberService.memberGrade(mvo);
		
		if(result == 1) {
			url="/admin/memberList";
		}else {
			url="/admin/main";
		}
		return "redirect:"+url;
	}
	
	@ResponseBody
	@PostMapping("/memberDelete")
	public String memberDelete(@RequestParam(value="checkBoxArr[]") List<String> chkbox, AdmMemberVO mvo) throws Exception {
		log.info("memberDelete 호출 성공");
		log.info("삭제할 회원번호: " + mvo.getU_no());
		log.info("배열 확인:" + chkbox.get(0));
		
		int result = 0;
		String url = "";
		
		
		result = admMemberService.memberDelete(mvo);
		log.info("result= " +result);
		if(result == 1) {
			url="/admin/nmemberList";
		}else {
			url="/admin/memberDetail?u_no="+mvo.getU_no();
		}
		return "redirect:"+url;
	}
		
}
