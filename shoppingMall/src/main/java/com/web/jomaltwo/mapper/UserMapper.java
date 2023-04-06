package com.web.jomaltwo.mapper;

import com.web.jomaltwo.model.UserDTO;




public interface UserMapper {
	
	public int userInput(UserDTO dto);
	
	public UserDTO idCheck(String uid);
	
	public UserDTO userLogin(UserDTO dto);
	
	public String findId(UserDTO dto);
	
	public int findPw(String uid, String uEmail,String ciperPw);
	
	public int userInfoUpdate(UserDTO dto);
	
	public UserDTO userInfo(String id);
	
	public int userAddressUpdate(UserDTO dto);
	
	public int userPwUpdate(UserDTO dto);
}
