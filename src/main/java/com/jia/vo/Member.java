package com.jia.vo;



import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**lombok 라이브러리
 * getter/setter/equals/toString 등의 메서드를 자동 생성
 * data 어노테이션 (이클립스 sts)에 설치 후 롬복라이브러리를 추가 후 사용 가능
 * ide에 설치되어있으면 어노테키션션을 추가해도 메서드가 생성되지 않을 수 있음
 * outline view를 통해 메서드가 생성되었는지 확인
 * @author user
 *
 */

//lombok 제공 ->pom.xml에 library 추가를 해놓아서 사용 가넝
@Data
public class Member {
	private String id;
	private String pw;
	private String name;
	private int age;
	
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date dueDate;
}
