package com.web.jomaltwo.mapper;


import com.web.jomaltwo.model.PointDTO;

public interface PointMapper {
	
//	public int pointInsert(PointDTO dto);
	
	public int initInsert(String member_id);
	
	public int pointCheck(String member_id);
	
	public int pointInsert(PointDTO pointDTO);
	
	

}
