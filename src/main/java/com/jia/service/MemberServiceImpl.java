package com.jia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jia.mapper.MemberMapper;
import com.jia.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	BCryptPasswordEncoder encoder;

	@Override
	public MemberVO login(MemberVO paramMember) {
		// TODO Auto-generated method stub
		
		// 사용자 정보 조회
		MemberVO member = memberMapper.login(paramMember);
		if(member!=null) {
			// 사용자가 입력한 비밀번호 데이터베이스에 암호화되어 저장된 비밀번호
			boolean res = encoder.matches(paramMember.getPw(), member.getPw());		
			
			// 비밀번호 인증이 성공하면 member객체를 반환
			if(res) {
				return member;
			}
		}

		return null;
	}

	@Override
	public int insert(MemberVO member) {
		member.setPw(encoder.encode(member.getPw()));
		return memberMapper.insert(member);
	}

	@Override
	public int idCheck(MemberVO member) {
		// TODO Auto-generated method stub
		return memberMapper.idCheck(member);
	}


}
