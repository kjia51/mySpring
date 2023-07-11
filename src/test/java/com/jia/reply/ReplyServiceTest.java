package com.jia.reply;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jia.mapper.ReplyMapper;
import com.jia.service.ReplyService;
import com.jia.vo.Criteria;
import com.jia.vo.ReplyVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class ReplyServiceTest {
	@Autowired
	ReplyService service;
	
	@Test
	public void test() {
		assertNotNull(service);
		Criteria cri = new Criteria();
		cri.setAmount(5);
		cri.setPageNo(1);
		List<ReplyVO> list = service.getList(50, cri);
		log.info("=================================");
		list.forEach(reply->{
			log.info("list : " +reply.getRno());
			log.info("list : " +reply.getBno());
			log.info("list : " +reply.getReply());
			log.info("list : " +reply.getReplyer());
			
			log.info("=================================");
		});
	}
}
