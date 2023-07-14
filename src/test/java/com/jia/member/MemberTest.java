package com.jia.member;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jia.mapper.MemberMapper;
import com.jia.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberTest {
	
	@Autowired
	MemberMapper memberMapper;
	@Test
	public void test() {
		MemberVO member = new MemberVO();
		member.setId("admin");
		member.setPw("1234");
		memberMapper.login(member);
	}
	@Test
	public void Inserttest() {
		MemberVO member = new MemberVO();
		member.setId("admin00");
		member.setPw("1234");
		member.setName("이름");
		int res = memberMapper.insert(member);
		System.out.println("결과 : "+res);
		System.out.println("pw : "+member.getPw());
	}
	@Test
	public void idCheckTest() {
		MemberVO member = new MemberVO();
		member.setId("admin");
		int res = memberMapper.idCheck(member);
		
		System.out.println("결과 : "+ res);
	}
	
	
}
