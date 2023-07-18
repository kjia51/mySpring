package com.jia.mapper;

import java.util.List;

import com.jia.vo.FileuploadVO;

public interface FileuploadMapper {
	public List<FileuploadVO> GetList(int bno);
	
	public int insert(FileuploadVO file);
}
