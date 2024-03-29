package com.web.jomaltwo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.service.CategoryService;

@Controller

@RequestMapping("/admin")
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
		return "redirect: categoryList.do";
	}
	
	@RequestMapping("/categoryList.do")
	public String categoryList(PageDTO pDto,Model model) {
		List<CategoryDTO> cDtos = service.categoryList(pDto);
		model.addAttribute("cDtos",cDtos);
		model.addAttribute("pageDto",pDto);
		
		return "admin/cate_list";
		
	}
	@RequestMapping("/categoryDel.do")
	public String categoryDelete(int cate_num) {
		int cnt = service.categoryRemove(cate_num);
		System.out.println(cnt);
		return "redirect:categoryList.do";
	}
	
	@RequestMapping("/categoryUpdate.do")
	public String categoryUpdate(CategoryDTO dto) {
		int cnt =  service.categoryModify(dto);
		return "redirect:categoryList.do";
	}
	
	  @GetMapping("/categorieSide")
	  public @ResponseBody List<CategoryDTO> getCategoryList() {
	    // 카테고리 리스트를 가져와서 List<Category> 형태로 반환하는 로직 작성
		List<CategoryDTO> categoryList = service.categoryAllList();
		System.out.println(categoryList);
	    return categoryList;
	  }
}
