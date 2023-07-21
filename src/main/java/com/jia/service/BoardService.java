package com.jia.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.jia.vo.BoardVO;
import com.jia.vo.Criteria;
import com.jia.vo.FileuploadVO;

@Service
public interface BoardService {
	
	public List<BoardVO> getListXml(Criteria cri, Model model);
	
	public int insert(BoardVO board);
	
	public int insertSelectKey(BoardVO board, List<MultipartFile> files) throws Exception;
	
	public BoardVO getOne(int bno);
	
	public int delete(int bno);
	
	public int update(BoardVO board, List<MultipartFile> files) throws Exception;
	
	public int totalCount(Criteria cri);

	public int count(int bno);
	
	public int updateReplyCnt(int bno, int amount);
	

	
}
