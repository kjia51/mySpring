package com.jia.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jia.vo.FileuploadVO;

@Service
public interface FileuploadService {
	public List<FileuploadVO> GetList(int bno);
	
	public int insert(FileuploadVO file);
	
	public int delete(FileuploadVO file);

	public int fileupload(List<MultipartFile> files, int bno) throws Exception;
}
