package com.jia.service;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
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
				member.setRole(memberMapper.getMemberRole(member.getId()));;
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
