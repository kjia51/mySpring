package com.jia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jia.mapper.BoardMapper;
import com.jia.mapper.ReplyMapper;
import com.jia.vo.Criteria;
import com.jia.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	
	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<ReplyVO> getList(int bno, Criteria cri) {
		return replyMapper.getList(bno, cri);
	}

	@Transactional
	@Override
	public int insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		//댓글 입력시 board 테이블의 댓글수(replyCnt)를 1 증가시킴..
		
		boardMapper.updateReplyCnt(vo.getBno(), 1);
		return replyMapper.insert(vo);
	}

	@Transactional
	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		ReplyVO vo = replyMapper.getOne(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		return replyMapper.delete(rno);
	}

	@Override
	public int update(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.update(vo);
	}

	@Override
	public int total(int bno) {
		// TODO Auto-generated method stub
		return replyMapper.total(bno);
	}








	
}
