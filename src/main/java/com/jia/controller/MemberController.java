package com.jia.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jia.service.MemberService;
import com.jia.vo.Member;

//관리되는 컨트롤러가 되기 위해선 servlet-context.xml에 들어가서 component-scan 수정
@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	/**
	 * 로그인 페이지 이동
	 * @return
	 */
	
	//로그인 요청이 오면 로그인 페이지를 반환 
	@GetMapping("login")
	public String login() {
		return "login";
	}
	
	
	@PostMapping("/loginAction")
	public String loginAction(Member member, Model model) {
		System.out.println("id :"+member.getId());
		System.out.println("pw : "+member.getPw());
		
		
		service.login(member, model);
		if(member!=null && !"".equals(member)) {
			if("admin".equalsIgnoreCase(member.getId())) {
				System.out.println("board/list");
				return "/board/list";
			}
			return "user";			
		}

		return "main";
	}
	
}
