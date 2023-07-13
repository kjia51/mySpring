package com.jia.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jia.service.MemberService;
import com.jia.vo.MemberVO;


//관리되는 컨트롤러가 되기 위해선 servlet-context.xml에 들어가서 component-scan 수정
@Controller
public class MemberController extends CommonRestController {
	
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
	public @ResponseBody Map<String, Object> loginAction(@RequestBody MemberVO member 
															, Model model, HttpSession session) {
		System.out.println(member.getId());
		System.out.println(member.getPw());
		
		member = service.login(member);
		
		if(member!=null) {
			session.setAttribute("member", member);
			session.setAttribute("userId", member.getId());
			return responseMap(1, "로그인");
		} else {
			return responseMap(0,"실패");
		}

		
	}
	
}
