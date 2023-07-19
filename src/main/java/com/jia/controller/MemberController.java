package com.jia.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jia.service.MemberService;
import com.jia.vo.MemberVO;

import lombok.RequiredArgsConstructor;


//관리되는 컨트롤러가 되기 위해선 servlet-context.xml에 들어가서 component-scan 수정
@Controller

public class MemberController extends CommonRestController {
	
	@Autowired
	MemberService service;

	/**
	 * 로그인 페이지 이동
	 * @return
	 */

	
	@GetMapping("/login")
	public void login() {
		
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
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
			session.setAttribute("userName", member.getName());		
			
			Map<String, Object> map = responseMap(REST_SUCCESS, "로그인 되었습니다.");

			if(member.getRole()!=null && member.getRole().contains("ADMIN_ROLE")) {
				// 관리자 로그인 - > 관리자 페이지로 이동
				map.put("url", "/admin");
			}
			
			map.put("url", "/board/list");
			
			return map;
//			return responseMap(REST_SUCCESS, "로그인 되었습니다.");
		} else {
			return responseMap(REST_FAIL,"아이디와 비밀번호를 확인해주세요");
		}

		
	}
	
	@PostMapping("/idCheck")
	public @ResponseBody Map<String ,Object> idCheck(@RequestBody MemberVO member){
		int res = service.idCheck(member);
		// count=1 실패
		// update, insert, delete>0
		
		if(res==0) {
			return responseMap(REST_SUCCESS,"사용가능한 아이디입니다");
			
		} else {
			return responseMap(REST_FAIL,"이미 사용중인 아이디 입니다.");
			
		}
	}
	@PostMapping("/register")
	public @ResponseBody Map<String, Object> register(@RequestBody MemberVO member){
		try {
			int res =service.insert(member);
			return responseWriteMap(res);
		} catch(Exception e) {
			return responseMap(REST_FAIL, "등록중 예외사항 발생");
		}
	}
	
}
