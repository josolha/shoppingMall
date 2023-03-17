package com.web.jomaltwo.mapper;

import com.web.jomaltwo.model.UserDTO;

public interface UserMapper {
	
	public int userInput(UserDTO dto);
	
	public UserDTO idCheck(String uid);
	
	public UserDTO userLogin(UserDTO dto);

}
