package com.web.jomaltwo.service;

import javax.servlet.http.HttpServletRequest;

import com.web.jomaltwo.model.UserDTO;




public interface UserService {
	
	public int userInsert(UserDTO dto);
	
	public UserDTO idCheck(String uid);
	
	public boolean userLogin(UserDTO dto,HttpServletRequest req);
	
	public String getFindId(UserDTO dto);
	
	public int getFindPw(String id, String Email);
	
	public int userInfoModify(UserDTO dto);
	
	public int userAddressModify(UserDTO dto);
	
	public UserDTO userInfo(String id);
	
	public String userPwCheck(String pw, UserDTO dto);
	
	public int userPwModify(UserDTO dto);
}
