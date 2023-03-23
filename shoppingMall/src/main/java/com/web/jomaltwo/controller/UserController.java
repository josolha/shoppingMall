package com.web.jomaltwo.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
	
	@RequestMapping(value= "login.do", method =RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="") String moveUrl, Model model) {
		System.out.println("moveUrl" + moveUrl);
		model.addAttribute("moveUrl",moveUrl);
		return "user/login/login_form";
	}
	
	@RequestMapping(value= "login.do", method =RequestMethod.POST)
	// RedirectAttributes extends Model : redirect시에 메시지 전달
	public String memberLogin(@RequestParam(defaultValue="") String moveUrl, UserDTO dto,HttpServletRequest req, RedirectAttributes rttr) {
		
//		System.out.println("id :" + dto.getId());
		
		boolean result = uService.userLogin(dto, req);
		
		if(!result) { // 로그인 실패 
			rttr.addFlashAttribute("result", 0); // 값을 전달하고 사라짐 <-> forward는 자동으로 model로 값을 보냄
			return "redirect:/user/login.do"; // redirect는 get 방식이므로 위로 올라감 
		}
		
		System.out.println("post :" + moveUrl);
		
		if(!moveUrl.equals("")) {
			return "redirect:"+moveUrl;
		}
		return "redirect:/";
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
	
	
	@RequestMapping("idCheck.do")
	@ResponseBody
	public String userIdCheck(@RequestParam("uid") String uid) {
		
		UserDTO dto = uService.idCheck(uid);
		
		if(dto != null || "".equals(uid.trim())) {
			return "no"; // 사용불가
		}
		
		return "yes"; // 사용가능 
	}
}
