package com.jia.mapper;

import java.util.List;

import com.jia.vo.BookVO;
import com.jia.vo.Criteria;

public interface BookMapper {
	
	public List<BookVO> getList(Criteria cri);

	public int totalCnt(Criteria cri);
	
	public BookVO getOne(int no);
	
	public int visitCnt(int no);
}
