package com.jia.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jia.vo.AnimalVO;

@Service
public interface MapService {

	public List<AnimalVO> mapList();
	
}
