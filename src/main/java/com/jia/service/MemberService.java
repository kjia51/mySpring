package com.jia.service;


import com.jia.vo.MemberVO;



public interface MemberService {
	//객체 생성대신 주입시키는 방법

	public MemberVO login(MemberVO member);
//	@Autowired
//	MemberDao dao;
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
