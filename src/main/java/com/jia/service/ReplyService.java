package com.jia.service;

import java.util.List;

import com.jia.vo.Criteria;
import com.jia.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> getList(int bno, Criteria cri);
	
	public int insert(ReplyVO vo);

	public int delete(int rno);
	
	public int update(ReplyVO vo);
	
	public int total(int bno);
	
}
