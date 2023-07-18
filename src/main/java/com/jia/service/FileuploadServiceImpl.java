package com.jia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jia.mapper.FileuploadMapper;
import com.jia.vo.FileuploadVO;

@Service
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

}
