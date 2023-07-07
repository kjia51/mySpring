package com.jia.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jia.vo.BookVO;
import com.jia.vo.Criteria;

@Service
public interface BookService {
	
	public List<BookVO> getList(Criteria cri, Model model);
	
	public BookVO getOne(int no, Model model);
	
	public int visitCnt(int no);
}
