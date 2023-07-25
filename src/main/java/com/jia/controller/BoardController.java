package com.jia.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jia.service.BoardService;
import com.jia.service.FileuploadService;
import com.jia.service.MapService;
import com.jia.service.ReplyService;
import com.jia.vo.AnimalVO;
import com.jia.vo.BoardVO;
import com.jia.vo.Criteria;
import com.jia.vo.FileuploadVO;

import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Autowired
	ReplyService replyService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	FileuploadService fileuploadService;

	@GetMapping("/main")
	public String main() {
		return "/board/main";
	}
	
	
	@GetMapping("/reply/test")
	public String test() {
		return "/reply/test";
	}
	
	@GetMapping("datepicker")
	public String datapicker() {
		return "/board/datepicker";
	}
//	public String test(ReplyVO vo) {
//		replyService.insert(vo);
//		return "/reply/test";
//	}
	
	@GetMapping("msg")
	public void msg() {
		
	}
	@GetMapping("message")
	public void message(Model model) {
		
	}
	@GetMapping("join")
	public String join() {
		return "/join";
	}
	
	@GetMapping("login")
	public String login() {
		return "/board/login";
	}
	
	
	
	
	/**
	 * 파라메터의 자동수집 기본생성자를 이용해서 객체 생성
	 * setter 메서드를 이용해서 생성
	 * @param cri
	 * @param model
	 */
	
	@GetMapping("list")
	public void getList(Criteria cri, Model model) {
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		List<BoardVO> list = boardService.getListXml(cri, model);
		log.info("cri : "+ cri);
		log.info("==============================");
		log.info("list : " + list);
		log.info("==============================");
//		model.addAttribute("list",list);
			
		stopWatch.stop();
		log.info("수행시간 : "+ stopWatch.getTotalTimeMillis()+"(ms)초");
		
	}

	/**
	 * requestMapping 에 board
	 *  /board/write
	 * @param bno
	 * @param model
	 */
	@Autowired
	MapService mapService;
	
	@GetMapping("/map")
	public String map(Model model) {
		List<AnimalVO> list = mapService.mapList();
		model.addAttribute("lists",list);
		return "/map";
	}
	
	
	@GetMapping("view")
	public String getOne(@Param("bno") int bno, Model model, Criteria cri) {
		BoardVO board = boardService.getOne(bno);
		boardService.count(bno);
		List<FileuploadVO> files = fileuploadService.GetList(bno);
		model.addAttribute("board",board);
		model.addAttribute("files",files);
		
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
	public String writeAction(BoardVO board, List<MultipartFile> files ,RedirectAttributes redirect, Model model) {
		
//		req.setCharacter
		String msg="";
		
		int res;
		try {
			//시퀀스 조회 후 시퀀스 번호를 bno에 저장
			//게시물 등록 및 파일 첨부
			res = boardService.insertSelectKey(board, files);
			if(res>0) {
				msg = board.getBno()+"번이 등록되었습니다";
				//url?msg=등록(쿼리스트링으로 전달 -> param.msg)
				// redirect.addAttribute("msg",msg);
				// 세션에 저장(새로고침 시 유지되지 않음) -> msg
//				redirect.addAttribute("msg",msg);
				redirect.addFlashAttribute("msg",msg);
				return "redirect:/board/list";
				
			} else {
				msg = "등록에 실패 했습니다";
				model.addAttribute("msg",msg);
				return "/board/message";
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			if(e.getMessage().indexOf("첨부파일")>-1) {
				model.addAttribute("msg", e.getMessage());
			} else {
				model.addAttribute("msg", "등록 중 예외사항이 발생하였습니다.");
			}
			
			return "board/message";
		}

	}
	@GetMapping("write")
	public void write(BoardVO board, Model model) {
		
		//return "redirect:/board/list";
	}

	/**
	 * 수정하기 bno를 파라메터로 받아야함
	 * 버튼 버튼의 액션이 달라짐
	 * @param paramVO
	 * @param model
	 * @return
	 */
	@GetMapping("edit")
	public String edit(BoardVO paramVO, Model model) {
		BoardVO board = boardService.getOne(paramVO.getBno());
		List<FileuploadVO> files = fileuploadService.GetList(paramVO.getBno());
		model.addAttribute("files",files);
		model.addAttribute("board",board);
		return "/board/edit";
	}	
	
	@GetMapping("editAction")
	public String editAction(BoardVO board, List<MultipartFile> files , Criteria cri, RedirectAttributes redirect, Model model) {
		
		//?pageNo=1 
		//=> request.getParam
		
		//request 내장객체에 저장
		//request.setAttr(""), session.setAttr("")
		//request.getAttr("")
		
		//수정
		int res;
		try {
			res = boardService.update(board, files);
			if(res>0) { 
				
				// redirect 시 request 영역이 공유되지 않으므로 RedirectAttributes 사용
				redirect.addFlashAttribute("msg","수정 완료");
				
				// ?~~ 
				redirect.addAttribute("pageNo", cri.getPageNo());
				redirect.addAttribute("searchField", cri.getSearchField());
				redirect.addAttribute("searchWord", cri.getSearchWord());
				//상세페이지로 이동
				return "redirect:/board/view?bno="+board.getBno();			
			} else {			
				model.addAttribute("msg","수정 중 예외사항 발생");
				return "/board/message";			
			}
		} catch (Exception e) {
			log.info(e.getMessage());
			if(e.getMessage().indexOf("첨부파일")>-1) {
				model.addAttribute("msg", e.getMessage());
			} else {
				model.addAttribute("msg", "수정 중 예외사항이 발생하였습니다.");
			}
			
			return "board/message";
		}
	}
	
	@GetMapping("delete")
	public  String delete(@Param("bno") int bno, RedirectAttributes redirect, Model model) {
		int res = boardService.delete(bno);
		if(res > 0) {
			redirect.addFlashAttribute("msg", "삭제되었습니다.");
			return "redirect:/board/list";
		}
		else {
			model.addAttribute("msg","삭제중");
			return "/board/message";
			
		}
	}
}
