package com.jia.controller;



import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jia.vo.Member;

@Controller
public class RestController {
	
	//객체 반환중
	//http://localhost:8080/rest?id=test&pw=1234
	@GetMapping("rest")
	//메서드 선언부의 리턴타입에 response body 어노테이션 추가

	public @ResponseBody Member rest(Member member) {
		return member;
	}
	
	
	/**
	 * ResponseEntity 헤더정보를 가공하기 위한 용도로 사용
	 * request, response 객체를 직접 다루지 않고 스프링 mvc에서 제공해주는 
	 * 어노테이션 또는 객체를 이용
	 * 
	 * @return
	 */
	
	//JSON 방식으로 
	@GetMapping("restResponseEntity")
	public ResponseEntity<String> rest1(){
		HttpHeaders header = new HttpHeaders();
		//content-type
		// application/json 타입 정의
		header.add("content-type","application/json;charset=utf-8");
		
		String msg = "{\"name\":\"모모\"}";
		ResponseEntity<String> rs = new ResponseEntity<String>(msg, header, HttpStatus.OK);
		return rs;
	}
}
