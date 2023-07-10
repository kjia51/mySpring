package com.jia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jia.service.BookService;
import com.jia.vo.BookVO;
import com.jia.vo.Criteria;


import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/book/*")
@Log4j
public class BookController {
	
	@Autowired
	BookService bookService;
	
	@GetMapping("list")
	public void list(Criteria cri, Model model) {
		// pageNo type int -> ''
		log.info("cri :"+cri);
		List<BookVO> list = bookService.getList(cri, model);
		
		model.addAttribute("list",list);
		model.addAttribute("msg","list");
//		return "/book/list";
//		->web-inf/view/book/list/jsp
	}
	
	@GetMapping("view")
	public BookVO getOne(BookVO book, Model model) {
		BookVO bookVo = bookService.getOne(book.getNo(), model);
		bookService.visitCnt(book.getNo());
		model.addAttribute("book", bookVo);
		return book;
		
	}
	@GetMapping("join")
	public String join(){

		return "/book/join";
		
	}
}
