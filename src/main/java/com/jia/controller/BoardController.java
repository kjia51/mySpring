package com.jia.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.jia.service.BoardService;
import com.jia.vo.BoardVO;
import com.jia.vo.Criteria;
import com.jia.vo.PageDto;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@GetMapping("msg")
	public void msg() {
		
	}
	@GetMapping("message")
	public void message(Mode mode) {
		
	}

	
	@Autowired
	BoardService boardService;
	
	@GetMapping("list")
	public void getList(@Param("pageNo") int pageNo, @Param("Criteria") Criteria paramcri, Model model) {
		int totalCnt = boardService.totalCount();
		Criteria cri = new Criteria(paramcri.getSearchField(), paramcri.getSearchWord(), pageNo);
		List<BoardVO> list = boardService.getPageList(cri);
		PageDto pageDto = new PageDto(totalCnt, cri);
		//List<BoardVO> list = boardService.getListXml();
		log.info("==============================");
		log.info(list);
		log.info("==============================");
		model.addAttribute("list",list);
		model.addAttribute("pageDto",pageDto);
		model.addAttribute("totalCnt",totalCnt);

		
	}
	@GetMapping("pageNavi")
	public String PageNavi() {
		return "/common/pageNavi";
		
	}
	
	
	/**
	 * requestMapping 에 board
	 *  /board/write
	 * @param bno
	 * @param model
	 */
	@GetMapping("view")
	public String getOne(@Param("bno") int bno, Model model) {
		BoardVO board = boardService.getOne(bno);
		model.addAttribute("board",board);
		return "/board/view";
	}
	
	
	
	/**
	 * RedirectAttributes 🍕🍕🍔🍕🍕🍔
	 * Model과 같이 매개변수로 받아 사용
	 * 리다이렉트 url의 화면까지 데이터를 전달
	 * 
	 * addAttribute는 주소표시줄에 msg도 같이 넘겨줌
	 * addflashAttribute는 세션에 저장 후 페이지 전환 
	 * @param board
	 * @param redirect
	 * @param model
	 * @return
	 */
	@PostMapping("write")
	public String writeAction(BoardVO board, RedirectAttributes redirect, Model model) {
		
//		req.setCharacter
		String msg="";
		
		//시퀀스 조회 후 시퀀스 번호를 bno에 저장
		int res = boardService.insertSelectKey(board);
		if(res>0) {
			msg = board.getBno()+"번이 등록되었습니다";
			//url?msg=등록(쿼리스트링으로 전달 -> param.msg)
			// redirect.addAttribute("msg",msg);
			// 세션에 저장(새로고침 시 유지되지 않음) -> msg
//			redirect.addAttribute("msg",msg);
			redirect.addFlashAttribute("msg",msg);
			return "redirect:/board/list";
			
		} else {
			msg = "등록에 실패 했습니다";
			model.addAttribute("msg",msg);
			return "/board/message";
		}
	}
	@GetMapping("write")
	public void write(BoardVO board, Model model) {
		
		//return "redirect:/board/list";
	}
	
	@GetMapping("delete")
	public void delete(@Param("bno") int bno) {
		int res = boardService.delete(bno);
		if(res>0) {
			
		}
	}
	@GetMapping("edit")
	public String edit(BoardVO paramVO, Model model) {
		BoardVO board = boardService.getOne(paramVO.getBno());
		model.addAttribute("board",board);
		return "/board/edit";
	}
}
