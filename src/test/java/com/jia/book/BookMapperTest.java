package com.jia.book;



import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jia.mapper.BookMapper;
import com.jia.vo.BookVO;
import com.jia.vo.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class BookMapperTest {
	@Autowired
	BookMapper bookMapper;
	
	@Test
	public void test() {
		assertNotNull(bookMapper);
		Criteria cri = new Criteria();
		List<BookVO> list = bookMapper.getList(cri);
		list.forEach(book->{
			log.info("book============");
			log.info(book.getNo());
			log.info(book.getTitle());
			log.info(book.getAuthor());
		});
		
	}
}
