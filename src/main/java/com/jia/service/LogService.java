package com.jia.service;

import org.springframework.stereotype.Service;

import com.jia.vo.LogVO;

@Service
public interface LogService {
	public int insert(LogVO vo);
}
