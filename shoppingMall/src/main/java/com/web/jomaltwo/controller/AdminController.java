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
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value= "login.do", method =RequestMethod.GET)
	public String loginForm(Model model) {
		
		return "admin/ad_login";
	}
	
	//rest API 수정 필요
	@RequestMapping(value= "login.do", method =RequestMethod.POST)
	public String adminLogin(AdminDTO dto, HttpServletRequest request, RedirectAttributes rttr) {
				
		boolean result = service.adminLogin(dto,request);
		
		if(!result) { // 로그인 실패 
			rttr.addFlashAttribute("result", 0); // 값을 전달하고 사라짐 <-> forward는 자동으로 model로 값을 보냄
			return "redirect: login.do"; // redirect는 get 방식이므로 위로 올라감 
		}
		return "redirect: myPage.do";
	}
	
//    @PostMapping("/login")
//    public ResponseEntity<?> adminLogin(@RequestBody AdminDTO dto, HttpServletRequest request) {
//        boolean result = service.adminLogin(dto, request);
//        if (!result) {
//            return ResponseEntity.badRequest().build(); // 로그인 실패 시 400 Bad Request 반환
//        }
//        return ResponseEntity.ok().build(); // 로그인 성공 시 200 OK 반환
//    }
//    
	@RequestMapping("/logout.do")
	public String adminLogout(HttpSession session) {
		
		session.invalidate(); //session 초기화
		
		return "redirect: login.do";
	}
	@RequestMapping("/myPage.do")
	public String adminMain() {
		return "admin/ad_main";
	}
	
}

