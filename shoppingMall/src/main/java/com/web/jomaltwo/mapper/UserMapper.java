package com.web.jomaltwo.mapper;

import java.util.List;

import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.ProductDTO;
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
	
	public List<UserDTO> usersList();
	
	public int totalCnt(PageDTO dto);
	
	public List<UserDTO> usersShow(PageDTO pDto);
	
	public int usersDelete(int no);
	
}
