package com.web.jomaltwo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping("/ad_login.do")
	public String adminLogin() {
		return "admin/ad_login";
	}

}
