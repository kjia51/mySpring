package com.jia.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jia.service.MemberService;
import com.jia.vo.MemberVO;

import lombok.extern.log4j.Log4j;


//관리되는 컨트롤러가 되기 위해선 servlet-context.xml에 들어가서 component-scan 수정
@Controller
@Log4j
public class MemberController extends CommonRestController {
	
	@Autowired
	MemberService service;

	/**
	 * 로그인 페이지 이동
	 * @return
	 */

//	@Autowired
//	KakaoAPI kakaoservice;
//	
//	@RequestMapping("/login")
//	public void login(@RequestParam("code") String code, HttpSession session) throws IOException{
//		
//		System.out.println("code :" + code);
//		
		//토큰 발급
//		String access_Token = kakaoservice.getAccessToken(code);
//		
//		return "/board/list";
//	}
	
	@RequestMapping("/")
	public String main() {
		return "login";
	}
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@GetMapping("/list")
	public String list() {
		return "list";
	}
	
	@GetMapping("/login/naver")
	public String naverlogin() {
		return "/login/naver";
	}
	
	@GetMapping("/login/naver_callback")
	public String naverlogin_callback(HttpServletRequest request, Model model) {
		//return "/login/naver_callback";
		service.naverLogin(request, model);
		return "/login/naver";
	}
	


	@Autowired
	MemberService memberService;
	
	@RequestMapping("/kakaologin")
	public String login(@RequestParam("code") String code, HttpSession session) {
		String access_Token = memberService.getAccessToken(code);
	    HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("userName", userInfo.get("nickname"));
	        session.setAttribute("access_Token", access_Token);
	    }
	    return "login";
	}

	@RequestMapping("/naverlogin")
	public String naverlogin(@RequestParam("code") String code, HttpSession session) {
		String access_Token = memberService.getAccessNaverToken(code);
	    HashMap<String, Object> userInfo = memberService.getNaverUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("name") != null) {
	        //session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("name", userInfo.get("name"));
	        session.setAttribute("access_Token", access_Token);
	    }
	    return "login";
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
