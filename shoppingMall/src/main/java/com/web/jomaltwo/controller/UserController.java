package com.web.jomaltwo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {


	@RequestMapping(value= "userLogin.do", method =RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="") String moveUrl, Model model) {
		System.out.println("moveUrl" + moveUrl);
		model.addAttribute("moveUrl",moveUrl);
		return "user/login/login_form";
	}
	

	
	@RequestMapping("/userLogout.do")
	public String memberLogout(@RequestParam(defaultValue="")String mode,HttpSession session) {
		
		session.invalidate(); //session 초기화
		if(mode.equals("change")) {
			return "redirect:memberLogin.do";
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/userRegister.do")
	public String memberRegister() {
		return "user/user_register";
	}
}
