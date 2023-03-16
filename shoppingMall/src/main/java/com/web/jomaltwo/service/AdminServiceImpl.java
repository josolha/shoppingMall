package com.web.jomaltwo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.AdminMapper;
import com.web.jomaltwo.model.AdminDTO;


@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper mapper;

	@Override
	public boolean adminLogin(AdminDTO dto,HttpServletRequest req ) {
		
		HttpSession session = req.getSession();
		
		AdminDTO loginDto = mapper.adminLogin(dto);
		
		if(loginDto != null) {
			String inputPw = dto.getPassword();  //사용자가 입력한 비번			
			String dbPw = loginDto.getPassword(); //DB에 있는 암호화된 비번
		
		//암호화 전에 조건
		if(inputPw.equals(dbPw)) { // 비밀번호와 일치
	
			session.setAttribute("loginDto", loginDto);
			
			return true;
			
		}else { // 비밀번호와 일치하지 않는 겨우
			req.setAttribute("loginErr", "pwErr");
			return false;
		}
		
	}else { // 일치하는 아이디가 없는 경우
		req.setAttribute("loginErr","idErr");
		return false;	
	}
	}
}