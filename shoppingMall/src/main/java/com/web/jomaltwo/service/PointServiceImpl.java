package com.web.jomaltwo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.PointMapper;
import com.web.jomaltwo.mapper.ProductMapper;

@Service
public class PointServiceImpl implements PointService{
	
	

	@Autowired
	private PointMapper mapper;
	

	@Override
	public int checkPoint(String member_id) {
		
		return mapper.pointCheck(member_id);
	}

}
