package com.jia.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jia.vo.BoardVO;
import com.jia.vo.Criteria;

@Service
public interface BoardService {
	
	public List<BoardVO> getListXml(Criteria cri, Model model);
	
	public int insert(BoardVO board);
	
	public int insertSelectKey(BoardVO board);
	
	public BoardVO getOne(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board);
	
	public int totalCount(Criteria cri);

	public int count(int bno);
	
}
