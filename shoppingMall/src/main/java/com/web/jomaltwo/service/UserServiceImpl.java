package com.web.jomaltwo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.ProductMapper;
import com.web.jomaltwo.mapper.UserMapper;
import com.web.jomaltwo.model.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	
	@Override
	public int userInsert(UserDTO dto) {
		
		return mapper.userInput(dto);
	}

}
