package com.jia.board;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.jia.mapper.BoardMapper;
import com.jia.vo.BoardVO;

import lombok.extern.log4j.Log4j;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class boardTest {

	@Autowired
	BoardMapper boardMapper;
	
	@Test
	public void updateReplyCntTest() {
		int res = boardMapper.updateReplyCnt(50, 1);
		assertEquals(1, res);
		}
//	@Test
//	public void getList() {
//		assertNotNull(boardMapper);
//		List<BoardVO> list = boardMapper.getList();
//			// 람다식/ 반복문 
//			list.forEach(board->{
//				log.info("boardVO============");
//				log.info(board.getBno());
//				log.info(board.getTitle());
//				log.info(board.getContent());
//			});
//		
//	}
//	
//	@Test
//	public void getListXml() {
//		List<BoardVO> list = boardMapper.getListXml();
//			list.forEach(board->{
//				log.info("boardVO============");
//				log.info(board.getBno());
//				log.info(board.getTitle());
//				log.info(board.getContent());
//			});
//	}
//	@Test
//	public void insert() {
//	    BoardVO board = new BoardVO();
//		board.setTitle("제목");
//		board.setContent("내용");
//		board.setWriter("user");
//		
//		int res = boardMapper.insert(board);
//		assertEquals(res, 1);
//	
//	}
//	
//	@Test
//	public void insertSelectKey() {
//	    BoardVO board = new BoardVO();
//		board.setTitle("제목selectkey");
//		board.setContent("내용");
//		board.setWriter("user");
//		int res = boardMapper.insertSelectKey(board);
//		log.info("bno : " + board.getBno());
//		assertEquals(res, 1);
//	}
//	
//	@Test
//	public void getOne() {
//	    BoardVO board = boardMapper.getOne(17);
//	    log.info(board.getTitle());
//	    log.info(board.getContent());
//	    log.info(board);
//	}
//	
//	@Test
//	public void delete() {
//		int res = boardMapper.delete(3);
//		assertEquals(res, 1);
//	}
//	
//	@Test
//	public void update() {
//		int bno = 4; 
//		
//	    BoardVO board = new BoardVO();
//	    board.setBno(bno);
//	    board.setTitle("제목4");
//	    board.setContent("내용4");
//		boardMapper.update(board);
//		BoardVO getboard = boardMapper.getOne(bno);
//		assertEquals("제목4", getboard.getTitle());
//	}
	
//	@Test
//	public void totalCount() {
//		int res = boardMapper.totalCount();
//		log.info(res);
//	}
}
