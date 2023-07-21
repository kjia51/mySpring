package com.jia.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jia.controller.FileuploadController;
import com.jia.mapper.FileuploadMapper;
import com.jia.vo.FileuploadVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Service
@Log4j
public class FileuploadServiceImpl implements FileuploadService {

	@Autowired
	FileuploadMapper mapper;
	
	@Override
	public List<FileuploadVO> GetList(int bno) {
		// TODO Auto-generated method stub
		return mapper.GetList(bno);
	}

	@Override
	public int insert(FileuploadVO file) {
		// TODO Auto-generated method stub
		return mapper.insert(file);
	}

	@Override
	public int delete(FileuploadVO files) {
		//파일 삭제
		//삭제할 파일 조회
		//삭제
		FileuploadVO inputfile = new FileuploadVO();
		inputfile.setBno(files.getBno());
		inputfile.setUuid(files.getUuid());
		FileuploadVO vo = mapper.getOne(inputfile);
		String savePath = vo.getSavePath();
		String s_savePath = vo.getS_savePath();
		if(savePath != null && !savePath.equals("")) {
			File file = new File(FileuploadController.ATTACHES_DIR+savePath);
			if(file.exists()) {
				if(!file.delete()) {
					System.err.println("path : "+savePath);
					System.err.println("파일삭제실패!");
				}
			}
		}
		if(s_savePath != null && !s_savePath.equals("")) {
			File file = new File(FileuploadController.ATTACHES_DIR+s_savePath);
			if(file.exists()) {
				if(!file.delete()) {
					System.err.println("path : "+s_savePath);
					System.err.println("파일삭제실패!");
				}
			}
		}
		return mapper.delete(inputfile);
		
	}
	
	public String getFolder() {
		LocalDate currentDate = LocalDate.now();
		log.info("CurrentDate : " + currentDate);
		
		String uploadPath = currentDate.toString().replace("-", File.separator)+File.separator;
		log.info("경로 : " + uploadPath);
		
		// 폴더 생성(없으면)
		File saveDir = new File(FileuploadController.ATTACHES_DIR+uploadPath);
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
	
	public int fileupload(List<MultipartFile> files, int bno) throws Exception {
		
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
				File sfile = new File(FileuploadController.ATTACHES_DIR+uploadPath+saveFileName);
				
				FileuploadVO vo = new FileuploadVO();
				
				//file(원본파일)을 sfile(저장할 대상 파일)에 저장
				file.transferTo(sfile);
				
				//주어진 파일의 Mime유형을 확인
				String contentType = Files.probeContentType(sfile.toPath());
				//Mime타입을 확인하여 이미지인 경우 썸네일 생성
				if(contentType!=null && contentType.startsWith("image")) {
					//썸네일 생성
					vo.setFiletype("I");
					String thumbnails = FileuploadController.ATTACHES_DIR+uploadPath+"s_"+saveFileName;
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
				int res = insert(vo);
				
				if(res>0) {
					insertRes++;
				}
				
				} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
					throw new Exception("첨부파일 등록 중 예외사항이 발생하였습니다.(IllegalStateException)");
				} catch (IOException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
					throw new Exception("첨부파일 등록 중 예외사항이 발생하였습니다.(IOException)");
				// 데이터 베이스 등록 시 발생 오류
				} catch(Exception e) {
					e.printStackTrace();
					throw new Exception("첨부파일 등록 중 예외사항이 발생하였습니다.(Exception)");					
				}
			}	
		return insertRes;
	}

}
