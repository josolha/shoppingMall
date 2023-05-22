package com.web.jomaltwo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.PaymentHistoryService;
import com.web.jomaltwo.service.ProductService;
import com.web.jomaltwo.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class UsersController {
	
	@Autowired
	private UserService uService;
	
	@RequestMapping("/users.do")
	public String usersList(PageDTO pDto,Model model) {
		
		List<UserDTO> usersList = uService.usersList(pDto);
		
		model.addAttribute("dtos",usersList);
		model.addAttribute("pageDto",pDto);
	
		
		return "admin/user_list";
	}
	
	@RequestMapping("/usersDel")
	public String usersDelete(int no) {
		int cnt  = uService.usersDelete(no);
		return "redirect: users.do";
	}
	

}

