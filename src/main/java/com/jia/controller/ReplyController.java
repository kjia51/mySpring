package com.jia.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.jia.service.ReplyService;
import com.jia.vo.Criteria;
import com.jia.vo.PageDto;
import com.jia.vo.ReplyVO;

import lombok.extern.log4j.Log4j;

/**
 * RestController
 * 		Controller가 REST 방식을 처리하기 위한 것임을 명시합니다. 
 * 
 */
@RestController
@Log4j
public class ReplyController extends CommonRestController{

	@Autowired
	ReplyService service;

	/**
	 * PathVariable
	 * 		URL 경로에 있는 값을 파라미터로 추출하려고 할 때 사용 
	 * 		경로의 일부분을 파라메터로 사용
	 * 
	 * url 경로의 일부를 변수로 사용
	 *	/reply/list/83
	 * @return
	 */
	@GetMapping("/reply/list/{bno}/{page}")
	public Map<String, Object> getList(@PathVariable("bno") int bno, @PathVariable("page") int page){
		Map<String, Object> map = new HashMap<String, Object>();
		
		log.info("bno : " + bno);
		log.info("page : " + page);

		Criteria cri = new Criteria();
		cri.setPageNo(page);
		
		//페이지 처리(시작~끝)
		List<ReplyVO> list = service.getList(bno, cri);
		int total = service.total(bno);
		
		//페이지 블럭을 생성
		PageDto pageDto = new PageDto(cri, total);
		
		map.put("list", list);
		map.put("pageDto", pageDto);
		
		
		return responseListMap(list, pageDto);
	}
	
	
	@GetMapping("/reply/delete/{rno}")
	public Map<String, Object> delete(@PathVariable("rno") int rno){
//		Map<String, Object> map = new HashMap<String, Object>();
//		int res = service.delete(rno);
//		if(res > 0) {
//			map.put("result", "success");
//		} else {
//			map.put("result", "fail");
//			map.put("message", "댓글 삭제중 예외사항이 발생 하였습니다.");
//		}
//		return map;
		
		return responseDeleteMap(service.delete(rno));
	}

	
	
	/**
	 * RequestBody
	 * 		JSON 데이터를 원하는 타입으로 바인딩 처리
	 * 		파라메터 자동수집
	 * @param vo
	 * @return
	 */
	@PostMapping("/reply/insert")
	public Map<String, Object> insert(@RequestBody ReplyVO vo){

		Map<String, Object> map = new HashMap<String, Object>();

		try {
			int res = service.insert(vo);
			return responseWriteMap(res);
			
		} catch(Exception e) {
			map.put("result", "fail");
			map.put("message", e.getMessage());
		}
		

		return map;
	}
	
	@PostMapping("/reply/editAction")
	//@RequestBody : json 타입을 내가 원하는 타입으로 
	public Map<String, Object> update(@RequestBody ReplyVO vo){

		return responseEditMap(service.update(vo));
	}
	
	// map을 생성 후 result, msg 세팅
	public Map<String, Object> responseMap(int res, String msg){
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(res>0) {
			map.put("result", "success");
			map.put("msg", msg+" 되었습니다.");
		} else {
			map.put("result", "fail");
			map.put("msg", msg+" 중 오류가 발생하였습니다");
		}
		return map;
		
	}
	
}



















