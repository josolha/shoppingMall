package com.web.jomaltwo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	
	
	@RequestMapping("/categoryInput.do")
	public String categoryInput() {
		
		return "admin/cate_input";
	}
	
	@RequestMapping("/categoryAdd.do")
	public String categoryAdd(CategoryDTO dto) {
		int cnt = service.categoryAdd(dto);
		return "redirect:cate_list.do";
	}

}
