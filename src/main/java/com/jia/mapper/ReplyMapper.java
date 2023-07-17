package com.jia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jia.vo.Criteria;
import com.jia.vo.ReplyVO;

public interface ReplyMapper {
	
	/**
	 * 매개변수 두개 이상이 파라메터로 전달되는 경우
	 * Param 어노테이션
	 * @param bno
	 * @param cri
	 * @return
	 */
	public List<ReplyVO> getList(@Param("bno") int bno, @Param(value="cri") Criteria cri);
	
	public int insert(ReplyVO vo);
	
	public int delete(int rno);
	
	public int update(ReplyVO vo);
	
	public int total(int bno);
	
	public ReplyVO getOne(int rno);
}
