package com.web.jomaltwo.service;

import java.util.List;
import java.util.UUID;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.PointMapper;
import com.web.jomaltwo.mapper.ProductMapper;
import com.web.jomaltwo.mapper.UserMapper;
import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.UserDTO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private JavaMailSender mailSender;
	

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private PointMapper pMapper;
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	
	@Override
	public int userInsert(UserDTO dto) {
		
		String inputPw = dto.getPw();
		String ciperPw = pwEncoder.encode(inputPw);
		dto.setPw(ciperPw);
		System.out.println(dto);
		mapper.userInput(dto);
		
		return pMapper.initInsert(dto.getId());
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
				session.setAttribute("userType", "user");  // 사용자 유형을 'member'로 설정

				
				return true;
				
			}else { 
				return false;
			}
			
		}else { 
			return false;	
		}
	}


	@Override
	public String getFindId(UserDTO dto) {
		
		return mapper.findId(dto);
	}


	@Override
	public int getFindPw(String id, String email) {
		//임시 비밀번호 생성
		String tempPw = UUID.randomUUID().toString().substring(0,6);
		
		MimeMessage mail = mailSender.createMimeMessage();
	      
	      String mailContents = "<h3>임시 비밀번호 발급</h3></br>"
	            + "<span>사용자가 본인임을 확인하려고 합니다. <br/>다음 확인코드를 입력하세요.</span>"
	            + "<h2>"+tempPw+"</h2>"
	      		+ "<p> <b>로그인 후</b> 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p>";
	      
	      try {
	         mail.setSubject("jomaltwo [임시 비밀번호]", "utf-8");
	         mail.setText(mailContents, "utf-8", "html");
	         
	         // 수신자 셋팅
	         mail.addRecipient(RecipientType.TO, new InternetAddress(email));
	         
	         mailSender.send(mail);
	         
	      } catch (Exception e) {         
	         e.printStackTrace();
	      }
	      
	      //임시비번 암호와
	      String ciperPw = pwEncoder.encode(tempPw);
	      System.out.println(ciperPw);
	      int n = mapper.findPw(id, email, ciperPw);
	      
	      return n;
	}


	@Override
	public int userInfoModify(UserDTO dto) {
		
		return mapper.userInfoUpdate(dto);
	}


	@Override
	public UserDTO userInfo(String id) {

		return mapper.userInfo(id);
	}


	@Override
	public int userAddressModify(UserDTO dto) {
		
		return mapper.userAddressUpdate(dto);
	}


	@Override
	public String userPwCheck(String pw, UserDTO dto) {
		
		String chkResult = "";
		//암호화된 비번
		String dbPw = dto.getPw();
		
		if(pwEncoder.matches(pw, dbPw)) {
			chkResult ="ok";
		}else {
			chkResult="no";
		}
		return chkResult;
	}


	@Override
	public int userPwModify(UserDTO dto) {
		
		// 새 비밀번호 암호화
		String ciperPw = pwEncoder.encode(dto.getPw());
		
		// 암호화된 비번을 dto에 셋팅
		dto.setPw(ciperPw);
		
		//수정후 결과값 가져오기
		int n = mapper.userPwUpdate(dto);
		
		return n;
		
	}

	@Override
	public List<UserDTO> usersList(PageDTO pDto) {
		
		int totalCnt = mapper.totalCnt(pDto);
		
		pDto.setValue(totalCnt, pDto.getCntPerPage());
		
		
		
		return mapper.usersShow(pDto);
	}


	@Override
	public int usersDelete(int no) {
		// TODO Auto-generated method stub
		return mapper.usersDelete(no);
	}
}
