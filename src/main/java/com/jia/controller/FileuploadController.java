package com.jia.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
	private static final String ATTACHES_DIR = "c:\\upload\\";
	
	/**
	 * 전달된 파일이 없는 경우
	 * 라이브러리 추가 , multipartresolver bean 생성
	 * @param files
	 * @return
	 */
	@PostMapping("/file/fileuploadAction")
	public String fileuploadAction(List<MultipartFile> files, int bno, RedirectAttributes rttr) {
		
		int insertRes=fileupload(files, bno);
		//});
		String msg = insertRes + "건 저장되었습니다.";
		rttr.addAttribute("msg", msg);
		return "redirect:/file/fileupload";
	}
	
	@PostMapping("/file/fileuploadActionFetch")
	public @ResponseBody Map<String, Object> fileuploadActionFetch(List<MultipartFile> files, int bno) {
		log.info("fileuploadActionFetch");
		int insertRes=fileupload(files, bno);
		log.info("업로드 건수 : " + insertRes);
		return responseMap("success", insertRes + "건 저장되었습니다.");
	}
	
	@Autowired
	FileuploadService service;
	
	@GetMapping("/file/list/{bno}")
	public @ResponseBody Map<String, Object> fileuploadList(@PathVariable("bno") int bno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", service.GetList(bno));
		return map;
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
	public int fileupload(List<MultipartFile> files, int bno) {
	
		int insertRes=0;
		//files.forEach(file->{
		for(MultipartFile file : files) {	
			// 선택된 파일이 없는 경우 다음파일로 이동
			if(file.isEmpty()) {
				continue;
			}	
			try {
				
				/**
				 *  uuid : 소프트웨어 구축에 쓰이는 식별자 표준
				 *  파일이름이 중복되어 파일이 소실되지 않도록 uuid를 붙여서 저장
				 */
				UUID uuid = UUID.randomUUID();
				String saveFileName = uuid+"_"+file.getOriginalFilename();
				
				// c:/upload/2023/7/18/
				//dir  :년/월/일
				String uploadPath= getFolder();
				File sfile = new File(ATTACHES_DIR+uploadPath+saveFileName);
				
				FileuploadVO vo = new FileuploadVO();
				
				//file(원본파일)을 sfile(저장할 대상 파일)에 저장
				file.transferTo(sfile);
				
				//주어진 파일의 Mime유형을 확인
				String contentType = Files.probeContentType(sfile.toPath());
				//Mime타입을 확인하여 이미지인 경우 썸네일 생성
				if(contentType!=null && contentType.startsWith("image")) {
					//썸네일 생성
					vo.setFiletype("I");
					String thumbnails = ATTACHES_DIR+uploadPath+"s_"+saveFileName;
					//썸네일 생성, 원본파일, 크기 , 저장경로
					Thumbnails.of(sfile).size(100,100).toFile(thumbnails);
				} else {
					vo.setFiletype("F");
					
				}
				
				
				vo.setBno(bno);
				vo.setFilename(file.getOriginalFilename());
				vo.setFiletype("I");
				vo.setUploadpath(uploadPath);
				vo.setUuid(uuid.toString());
				int res = service.insert(vo);
				
				if(res>0) {
					insertRes++;
				}
				
				} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}	
		return insertRes;
	}
	}
	
	
	
