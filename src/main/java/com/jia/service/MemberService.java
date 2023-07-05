package com.jia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jia.dao.MemberDao;
import com.jia.vo.Member;


@Service
public class MemberService {
	//객체 생성대신 주입시키는 방법
	@Autowired
	MemberDao dao;
	public Member login(Member paramMember, Model model) {
		Member member = dao.login(paramMember);
		if(member == null){
			model.addAttribute("message","아이디/비밀번호를 확인해주세요");
		} else {
			model.addAttribute("message",member.getName()+"님 환영합니다.");
		}
		return member;
	}
}
