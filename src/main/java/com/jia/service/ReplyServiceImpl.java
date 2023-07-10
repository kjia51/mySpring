package com.jia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jia.mapper.ReplyMapper;
import com.jia.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyMapper replyMapper;
	
	@Override
	public List<ReplyVO> getList(int bno) {
		return replyMapper.getList(bno);
	}

	@Override
	public int insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyMapper.insert(vo);
	}

	@Override
	public int delete(int rno) {
		// TODO Auto-generated method stub
		return replyMapper.delete(rno);
	}

	@Override
	public int update(int rno) {
		// TODO Auto-generated method stub
		return replyMapper.update(rno);
	}




	
}
