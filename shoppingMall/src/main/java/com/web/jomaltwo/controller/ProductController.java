package com.web.jomaltwo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.service.CategoryService;

@Controller
public class ProductController {
	
	@Autowired
	private CategoryService service;
	
	@RequestMapping("/productList.do")
	public String productList() {
		return "admin/prod_list";
	}
	@RequestMapping("/productInput.do")
	public  String productRegister(Model model) {
		List<CategoryDTO> cDtos = service.categoryList();
		model.addAttribute("categoryList",cDtos);
		
		return "admin/prod_input";
	}

}
