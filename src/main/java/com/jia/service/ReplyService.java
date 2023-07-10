package com.jia.service;

import java.util.List;

import com.jia.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> getList(int bno);
	
	public int insert(ReplyVO vo);

	public int delete(int rno);
	
	public int update(int rno);
}
