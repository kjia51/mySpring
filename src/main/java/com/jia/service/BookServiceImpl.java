package com.jia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jia.mapper.BookMapper;
import com.jia.vo.BookVO;
import com.jia.vo.Criteria;
import com.jia.vo.PageDto;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookMapper bookMapper;
	
	@Override
	public List<BookVO> getList(Criteria cri, Model model) {
		List<BookVO> list = bookMapper.getList(cri);
		int totalCnt = bookMapper.totalCnt(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		model.addAttribute("list",list);
		model.addAttribute("pageDto",pageDto);
		
		return list;

	}

	@Override
	public BookVO getOne(int no, Model model) {
		BookVO book = bookMapper.getOne(no);
		return book;
	}

	@Override
	public int visitCnt(int no) {
		int res = bookMapper.visitCnt(no);
		return res;
	}

}
