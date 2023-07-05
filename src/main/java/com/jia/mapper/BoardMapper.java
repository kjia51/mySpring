package com.jia.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jia.vo.BoardVO;
import com.jia.vo.Criteria;


public interface BoardMapper {
	// 동적인 쿼리를 사용하기 위해서는 부적합
	@Select("select * from tbl_board where bno > 0")
	// 추상메서드를 모아놓은 것이 인터페이스
	// 추상메서드
	public List<BoardVO> getList();

	public List<BoardVO> getListXml();
	
	public int insert(BoardVO board);
	
	public int insertSelectKey(BoardVO board);
	
	public BoardVO getOne(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
	
	public int totalCount();
	
	public List<BoardVO> getPageList(Criteria cri);
	
}
