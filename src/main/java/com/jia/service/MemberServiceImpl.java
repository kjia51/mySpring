package com.jia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jia.mapper.MemberMapper;
import com.jia.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper memberMapper;

	@Override
	public MemberVO login(MemberVO member) {
		// TODO Auto-generated method stub
		return memberMapper.login(member);
	}


}
