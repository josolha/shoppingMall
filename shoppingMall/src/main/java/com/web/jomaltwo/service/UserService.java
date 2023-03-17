package com.web.jomaltwo.service;

import javax.servlet.http.HttpServletRequest;

import com.web.jomaltwo.model.UserDTO;

public interface UserService {
	
	public int userInsert(UserDTO dto);
	
	public UserDTO idCheck(String uid);
	
	public boolean userLogin(UserDTO dto,HttpServletRequest req);
	
	
}
