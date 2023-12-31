package com.jia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.jia.mapper.BoardMapper;
import com.jia.vo.BoardVO;
import com.jia.vo.Criteria;
import com.jia.vo.FileuploadVO;
import com.jia.vo.PageDto;

/**
 * 각 계층간의 연결은 인터페이스를 활용하여 느슨한 결합을 합니다.
 * 느슨한 결합  : 하나의 콤포넌트의 변경이 다른 컴포넌트들의 변경을 요구하는 위험을 줄이는 것을 목적으로 하는 시스템에서
 * 콤포넌트간의 내부 의존성을 줄이는 것을 추구하는 디자인 목표
 * 
 * Service :계층 구조상 비즈니스 영역을 담당하는 객체
 * root-contest.xml : component-scan 속성에 패키지 등록
 * 
 * 서비스를 interface로 생성하는 이유
 * 1. 내부로직의 분리 : 인터페이스를 사용함으로써 내부로직의 변경, 수정시 유연하게 대처할 수 있다
 * 2. 구현체의 전환이 용이 : 구현체의 변경, 교체가 용이
 * 3. 테스트 용이성 : 단위테스트 시 테스트 용 구현체를 이용함으로써 테스트 수행
 * @author user
 * 
 *
 */
@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private FileuploadService fileuploadService;

	@Override
	public List<BoardVO> getListXml(Criteria cri, Model model) {
		/**
		 * 1. 리스트 조회
		 * 		- 검색어, 페이지 정보(startNo~endNo까지 조회)
		 * 2. 총 건수 조회 
		 * 3. pageDto 객체  생성
		 */
		
		int totalCnt = boardMapper.totalCount(cri);
		List<BoardVO> list = boardMapper.getListXml(cri);
		PageDto pageDto = new PageDto(cri, totalCnt);
		
		model.addAttribute("list", list);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageDto", pageDto);
		

		return list;
	}

	@Override
	public int insert(BoardVO board) {
		// TODO Auto-generated method stub
		return boardMapper.insert(board);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertSelectKey(BoardVO board, List<MultipartFile> files) throws Exception {
		// 게시물 업로드
		int res = boardMapper.insertSelectKey(board);
		// 
		fileuploadService.fileupload(files, board.getBno());
		return res;
	}

	@Override
	public BoardVO getOne(int bno) {
		// TODO Auto-generated method stub
		return boardMapper.getOne(bno);
	}

	@Override
	public int delete(int bno) {
		//게시물을 삭제시 첨부된 파일이 있는 경우 오류가 발생
		//첨부파일을 모두 삭제 - fileuploadService
		//첨부파일 리스트 조회
		//리스트를 돌면서 삭제 처리  - fileuploadService
		return boardMapper.delete(bno);
	}

	@Override
	public int update(BoardVO board, List<MultipartFile> files) throws Exception {
		// TODO Auto-generated method stub
		
		fileuploadService.fileupload(files, board.getBno());
		return boardMapper.update(board);
	}



	@Override
	public int totalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.totalCount(cri);
	}

	@Override
	public int count(int bno) {
		// TODO Auto-generated method stub
		return boardMapper.count(bno);
	}

	@Override
	public int updateReplyCnt(int bno, int amount) {
		// TODO Auto-generated method stub
		return boardMapper.updateReplyCnt(bno, amount);
	}







	
}
