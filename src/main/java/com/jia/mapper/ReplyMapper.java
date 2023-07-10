package com.jia.mapper;

import java.util.List;

import com.jia.vo.ReplyVO;

public interface ReplyMapper {
	public List<ReplyVO> getList(int bno);
	
	public int insert(ReplyVO vo);
	
	public int delete(int rno);
	
	public int update(int rno);
}
