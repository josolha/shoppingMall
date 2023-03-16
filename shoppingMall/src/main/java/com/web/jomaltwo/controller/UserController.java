package com.web.jomaltwo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.ProductService;
import com.web.jomaltwo.service.UserService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private ProductService pService;
	
	@RequestMapping(value= "login.do", method =RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="") String moveUrl, Model model) {
		System.out.println("moveUrl" + moveUrl);
		model.addAttribute("moveUrl",moveUrl);
		return "user/login/login_form";
	}
	
	
	@RequestMapping("/logout.do")
	public String memberLogout(@RequestParam(defaultValue="")String mode,HttpSession session) {
		
		session.invalidate(); //session 초기화
		if(mode.equals("change")) {
			return "redirect:user/login.do";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/register.do")
	public String userRegister() {
		return "user/user_register";
	}
	
	
	@RequestMapping("/insert.do")
	public String userInsert(UserDTO dto) {
		
		System.out.println(dto);
		
		int cnt = uService.userInsert(dto);
		
		return "redirect:/user/main.do";
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String userMain(Model model) {
		
		HashMap<String,List<ProductDTO>> map = pService.productBySpecs();
		model.addAttribute("map", map);
		
		return "user/user_main";
	}
}
