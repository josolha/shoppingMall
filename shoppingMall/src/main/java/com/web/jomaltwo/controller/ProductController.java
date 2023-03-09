package com.web.jomaltwo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
	@RequestMapping("/productList.do")
	public String productList() {
		return "admin/prod_list";
	}

}
