package com.jia.log;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jia.service.LogService;
import com.jia.vo.LogVO;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class LogServiceTest {
	@Autowired
	LogService service;
	
	public void test() {
		LogVO vo = new LogVO();
		vo.setClassname("classname");
		vo.setMethodname("methodname");
		vo.setParams("params");
		vo.setErrmsg("errmsg");
		vo.setRegdate("2023-07-17");
		int res = service.insert(vo);
		
		System.out.println("res : "+ res);
	}
}
