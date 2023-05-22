package com.web.jomaltwo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.web.jomaltwo.model.PaymentHistoryDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.PaymentHistoryService;
import com.web.jomaltwo.service.PointService;
import com.web.jomaltwo.service.UserService;



@Controller
@RequestMapping("/user")
public class UserMyPageController {
	
		@Autowired
		private UserService service;
		
		@Autowired
		private PointService pService;
		
		@Autowired
		private PaymentHistoryService hService;
	
	
		@GetMapping("/myPage.do")
		public String myProfile(@SessionAttribute("loginDto") UserDTO loginDto, Model model) {	
						
			UserDTO dto = service.userInfo(loginDto.getId());
			model.addAttribute("UserDto",dto);
			
			// 여기에 포인트랑 결제내역 추가해야 함.
			int totalPoint = pService.checkPoint(loginDto.getId());
			
			List<PaymentHistoryDTO> PaymentHistoydto = hService.getPaymentHistory(loginDto.getId());
			
			System.out.println(PaymentHistoydto);
			
			model.addAttribute("PaymentHistoydto",PaymentHistoydto);
			model.addAttribute("totalPoint",totalPoint);
			
			
			
			return "user/user_myPage";
	}
	   @PostMapping("/updateUserInfo")
	    public ResponseEntity<String> updateUserInfo(@RequestBody UserDTO userDTO) {
		   
		    System.out.println(userDTO);
		    
		    int cnt = service.userInfoModify(userDTO);
		    
	        return ResponseEntity.ok("User info updated successfully.");
	    }
	   
	   @PostMapping("/updateAddress")
	    public ResponseEntity<String> updateAddress(@RequestBody UserDTO userDTO) {
		   
		    System.out.println(userDTO);
		    
		    int cnt = service.userAddressModify(userDTO);
		    
	        return ResponseEntity.ok("User address updated successfully.");
	    }
	   
	   @GetMapping("/changePw.do")
	   public String changePw() {
		   return "user/user_change_pw";
	   }
	   
	   @PostMapping("/pwCheck.do")
	   @ResponseBody
		public ResponseEntity<String> pwCheck(String pw, @SessionAttribute("loginDto") UserDTO loginDto) {
		
			return ResponseEntity.ok(service.userPwCheck(pw, loginDto));
		   
		}
		@PostMapping("/pwChange.do")
		@ResponseBody
		public ResponseEntity<Integer> pwChange(@RequestBody UserDTO dto) {
			
			int n = service.userPwModify(dto);
			
			return ResponseEntity.ok(n);
		}
	   
	   
}



