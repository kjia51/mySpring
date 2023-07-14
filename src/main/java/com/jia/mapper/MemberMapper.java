package com.jia.mapper;

import com.jia.vo.MemberVO;

public interface MemberMapper {
	public MemberVO login(MemberVO member);

	public int insert(MemberVO member);
	
	public int idCheck(MemberVO member);
}
