package com.jia.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jia.service.FileuploadService;
import com.jia.vo.FileuploadVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Log4j
public class FileuploadController extends CommonRestController{
	
	public static final String ATTACHES_DIR = "c:\\upload\\";

	@Autowired
	FileuploadService service;
	
	/**
	 * 메서드의 리턴타입
	 * String 
	 *  /WEB-INF/views.반환값.jsp 응답페이지 주소
	 *  servlet-context.xml에 정의되어있다
	 * void
	 * 요청주소와 동일한 이름의 jsp를 반환
	 */
	
	@GetMapping("/file/fileupload")
	public void fileupload() {
		
	}
	
	/**
	 * 파일  업로드용 라이브러리 추가
	 * commons-fileupload
	 * 1, root-context.xml -> multipartresolver 빈 등록
	 * 2. 라이브러리 추가
	 * 3. 메서드의 매개변수로 multipartfile 이용
	 * cos.jar와 달리 파일을 저장하는 로직이 추가되어야 합니다
	 */
	
	
	
	/**
	 * 전달된 파일이 없는 경우
	 * 라이브러리 추가 , multipartresolver bean 생성
	 * @param files
	 * @return
	 * @throws Exception 
	 */
	@PostMapping("/file/fileuploadAction")
	public String fileuploadAction(List<MultipartFile> files, int bno, RedirectAttributes rttr) throws Exception {
		
		int insertRes=service.fileupload(files, bno);
		//});
		String msg = insertRes + "건 저장되었습니다.";
		rttr.addAttribute("msg", msg);
		return "redirect:/file/fileupload";
	}
	
	@PostMapping("/file/fileuploadActionFetch")
	public @ResponseBody Map<String, Object> fileuploadActionFetch(List<MultipartFile> files, int bno) throws Exception {
		log.info("fileuploadActionFetch");
		int insertRes=service.fileupload(files, bno);
		log.info("업로드 건수 : " + insertRes);
		return responseMap("success", insertRes + "건 저장되었습니다.");
	}
	
	
	@GetMapping("/file/list/{bno}")
	public @ResponseBody Map<String, Object> fileuploadList(@PathVariable("bno") int bno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", service.GetList(bno));
		return map;
	}
	
	@GetMapping("/file/delete/{uuid}/{bno}")
	public @ResponseBody Map<String, Object> fileDeleteList(FileuploadVO file) {
		FileuploadVO fileVO = new FileuploadVO();
		fileVO.setUuid(file.getUuid());
		fileVO.setBno(file.getBno());
		int res = service.delete(fileVO);
		if(res>0) {
			return responseDeleteMap(res);
		} else {
			return responseDeleteMap(res);		
		}
	}

	
	//중복 방지용 업로드 날짜를 폴더이름으로 사용 : 23/07/18
	public String getFolder() {
		LocalDate currentDate = LocalDate.now();
		log.info("CurrentDate : " + currentDate);
		
		String uploadPath = currentDate.toString().replace("-", File.separator)+File.separator;
		log.info("경로 : " + uploadPath);
		
		// 폴더 생성(없으면)
		File saveDir = new File(ATTACHES_DIR+uploadPath);
		if(!saveDir.exists()) {
			//mkdirs : 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 상위 디렉토리까지 생성
			if(saveDir.mkdirs()) {
				log.info("폴더 생성");
				
			} else {
				log.info("폴더 생성 실패");
			}
		}
		
		return uploadPath;
	}
	
	public static void main(String[] args) {
		LocalDate currentDate = LocalDate.now();
		String uploadPath = currentDate.toString().replace("-", File.separator)+File.separator;
		
		log.info("CurrentDate : " + currentDate);
		log.info("CurrentDate.toString() : " + currentDate.toString());
		log.info("경로 : " + uploadPath);
		
		// 폴더 생성(없으면)
		File saveDir = new File(ATTACHES_DIR+uploadPath);
		if(!saveDir.exists()) {
			saveDir.mkdirs();
		}

	}
	
	
	/**
	 * 파일 다운로드
	 * 컨텐츠 타입을 다운로드 받을 수 있는 형식으로 지정하여 파일을 다운로드 할 수 있게 처리
	 * @param fileName
	 * @return
	 */
	@GetMapping("/file/download")
	public ResponseEntity<byte[]> download(String fileName){
		log.info("download file : "+fileName);
		HttpHeaders headers = new HttpHeaders();
		
		
		File file = new File(ATTACHES_DIR+fileName);
		
		if(file.exists()) {
			//컨텐츠 타입 지정
			//APPLICATION_OCTET_STREAM : 이진파일 콘텐츠 유형
			headers.add("Content-type", MediaType.APPLICATION_OCTET_STREAM.toString());
			
			//컨텐츠에 대한 추가 설명 및 파일이름 한글처리
			try {
				headers.add("Content-Disposition"
						, "attachment; filename=\"" 
				+ new String(fileName.getBytes("UTF-8"),"ISO-8859-1")+"\"" );
				return new ResponseEntity<>(
							FileCopyUtils.copyToByteArray(file),
							headers,
							HttpStatus.OK
						);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}
	}
	
	
	
