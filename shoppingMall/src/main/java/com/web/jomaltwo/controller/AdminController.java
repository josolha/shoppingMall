package com.web.jomaltwo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.jomaltwo.model.AdminDTO;
import com.web.jomaltwo.service.AdminService;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value= "adminLogin.do", method =RequestMethod.GET)
	public String loginForm(Model model) {
		
		return "admin/ad_login";
	}
	
	@RequestMapping(value= "adminLogin.do", method =RequestMethod.POST)
	public String adminLogin(AdminDTO dto, HttpServletRequest request, RedirectAttributes rttr) {
				
		boolean result = service.adminLogin(dto,request);
		
		if(!result) { // 로그인 실패 
			rttr.addFlashAttribute("result", 0); // 값을 전달하고 사라짐 <-> forward는 자동으로 model로 값을 보냄
			return "redirect:adminLogin.do"; // redirect는 get 방식이므로 위로 올라감 
		}
		return "redirect:/";
	}
	@RequestMapping("/adminLogout.do")
	public String adminLogout(HttpSession session) {
		
		session.invalidate(); //session 초기화
		
		return "redirect:/";
	}
}

