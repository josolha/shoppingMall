package com.web.jomaltwo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


public class MemberController {
	
	@RequestMapping(value= "memberLogin.do", method =RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="") String moveUrl, Model model) {
		System.out.println("moveUrl" + moveUrl);
		model.addAttribute("moveUrl",moveUrl);
		return "login/loginForm";
	}
	

	
	@RequestMapping("/memberLogout.do")
	public String memberLogout(@RequestParam(defaultValue="")String mode,HttpSession session) {
		
		session.invalidate(); //session 초기화
		if(mode.equals("change")) {
			return "redirect:memberLogin.do";
		}
		
		return "redirect:/";
	}

}
