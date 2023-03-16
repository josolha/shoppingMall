package com.web.jomaltwo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UserController {

	@RequestMapping("/userLogin.do")
	public String userMain() {
		return "user/login/login_form";
	}
}
