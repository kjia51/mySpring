package com.jia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jia.vo.FileuploadVO;

@Service
public interface FileuploadService {
	public List<FileuploadVO> GetList(int bno);
	
	public int insert(FileuploadVO file);
}
