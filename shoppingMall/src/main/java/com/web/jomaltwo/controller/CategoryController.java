package com.web.jomaltwo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
		return "redirect:categoryList.do";
	}
	
	@RequestMapping("/categoryList.do")
	public String categoryList(Model model) {
		List<CategoryDTO> cDtos = service.categoryList();
		model.addAttribute("cDtos",cDtos);
		return "admin/cate_list";
		
	}
	@RequestMapping("/categoryDel.do")
	public String categoryDelete(int cate_num) {
		int cnt = service.categoryRemove(cate_num);
		System.out.println(cnt);
		return "redirect:categoryList.do";
	}
	
	
	
	

}
