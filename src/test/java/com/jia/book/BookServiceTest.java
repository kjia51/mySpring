package com.jia.book;



import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jia.mapper.BookMapper;
import com.jia.service.BookService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class BookServiceTest {
	@Autowired
	BookMapper bookMapper;
	
	@Test
	public void test() {
		assertNotNull(bookMapper);
		//bookMapper.getList();
		
	}
}
