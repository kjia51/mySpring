package com.jia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jia.mapper.MapMapper;
import com.jia.vo.AnimalVO;

@Service
public class MapServiceImpl implements MapService{

	@Autowired
	MapMapper mapMapper;
	
	@Override
	public List<AnimalVO> mapList() {
		// TODO Auto-generated method stub
		return mapMapper.mapList();
	}

}
