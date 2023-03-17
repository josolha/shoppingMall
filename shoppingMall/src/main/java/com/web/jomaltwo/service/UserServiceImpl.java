package com.web.jomaltwo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.ProductMapper;
import com.web.jomaltwo.mapper.UserMapper;
import com.web.jomaltwo.model.UserDTO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper mapper;
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	
	@Override
	public int userInsert(UserDTO dto) {
		
		String inputPw = dto.getPw();
		String ciperPw = pwEncoder.encode(inputPw);
		dto.setPw(ciperPw);
		System.out.println(dto);
		return mapper.userInput(dto);
	}


	@Override
	public UserDTO idCheck(String uid) {
		
		
		return mapper.idCheck(uid);
	}


	@Override
	public boolean userLogin(UserDTO dto, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		UserDTO loginDto = mapper.userLogin(dto);
		
		if(loginDto != null) {  //일치하는 아이디가 있는 경우
			String inputPw = dto.getPw();  //사용자가 입력한 비번			
			String dbPw = loginDto.getPw(); //DB에 있는 암호화된 비번
		
			if(pwEncoder.matches(inputPw, dbPw)) { // 입력 비밀번호와 암호화 비밀번호 매칭되면  
		
				session.setAttribute("loginDto", loginDto);
				
				return true;
				
			}else { 
				return false;
			}
			
		}else { 
			return false;	
		}
	}
}
