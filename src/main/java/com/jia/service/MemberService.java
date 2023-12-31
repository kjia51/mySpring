package com.jia.service;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.jia.vo.MemberVO;



public interface MemberService {
	//객체 생성대신 주입시키는 방법

	public MemberVO login(MemberVO member);

	public int insert(MemberVO member);
	
	public int idCheck(MemberVO member);
	
	public String getAccessToken(String code);
	
	public HashMap<String, Object> getUserInfo (String access_Token);

	String getAccessNaverToken(String code);
	
	public HashMap<String, Object> getNaverUserInfo (String access_Token);

	public void naverLogin(HttpServletRequest request, Model model);
	
//	public Member login(Member paramMember, Model model) {
//		Member member = dao.login(paramMember);
//		if(member == null){
//			model.addAttribute("message","아이디/비밀번호를 확인해주세요");
//		} else {
//			model.addAttribute("message",member.getName()+"님 환영합니다.");
//		}
//		return member;
//	}


}
