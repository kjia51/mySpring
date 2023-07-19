package com.jia.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jia.service.KakaoAPI;

@Controller
public class CommonController {
	
	@Autowired
	KakaoAPI service;
	
	@RequestMapping("/login")
	public String login(@RequestParam("code") String code, HttpSession session) throws IOException{
		
		System.out.println(code);
		
		//토큰 발급
		String access_Token = service.getAccessToken(code);
		
		return "/board/list";
	}
}
