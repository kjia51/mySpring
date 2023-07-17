package com.jia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jia.mapper.LogMapper;
import com.jia.vo.LogVO;


@Service
public class LogServiceImpl implements LogService {

	@Autowired
	LogMapper logmapper;
	
	@Override
	public int insert(LogVO vo) {
		// TODO Auto-generated method stub
		return logmapper.insert(vo);
	}

}
