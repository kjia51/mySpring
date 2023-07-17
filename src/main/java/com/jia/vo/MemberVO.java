package com.jia.vo;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String adminyn;
	private String status;
	private String grade;
	
	// 사용자 권한 조회
	private List<String> role;
	
}
