package com.jia.reply;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jia.mapper.ReplyMapper;
import com.jia.vo.Criteria;
import com.jia.vo.ReplyVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTest {
	
	@Autowired
	ReplyMapper mapper;
	
	@Test
	public void test() {
		assertNotNull(mapper);
		Criteria cri = new Criteria();
		cri.setAmount(5);
		cri.setPageNo(1);
		List<ReplyVO> list = mapper.getList(50, cri);
		log.info("=================================");
		list.forEach(reply->{
			log.info("list : " +reply.getRno());
			log.info("list : " +reply.getBno());
			log.info("list : " +reply.getReply());
			log.info("list : " +reply.getReplyer());
			
			log.info("=================================");
		});
	}
	
	@Test
	public void insert() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(22);
		vo.setReply("댓글");
		vo.setReplyer("작성자");
		
		int res = mapper.insert(vo);
		assertEquals(res, 1);

		
	}
	
	@Test
	public void updateTest() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(10);
		vo.setReply("댓글 수정하는 즁");
		vo.setReplyer("작성자");
		
		int res = mapper.update(vo);
		assertEquals(res, 1);
	}
	
	@Test
	public void deleteTest() {
		int rno = 12;
		int res = mapper.delete(rno);
		
		assertEquals(res, 1);
	}
	@Test
	public void totalTest() {
		int res = mapper.total(50);
		System.out.println(res);
	}
}
