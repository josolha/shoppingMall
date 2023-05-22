package com.web.jomaltwo.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.service.CategoryService;
import com.web.jomaltwo.service.PaymentHistoryService;
import com.web.jomaltwo.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class OrderController {
	
	@Autowired
	private PaymentHistoryService hService;
	
	@Autowired
	private ProductService pService;
	
	@RequestMapping("/orderList.do")
	public String productList(PageDTO pDto,Model model) {
		
		log.info("");
		
		List<ProductDTO> productList = pService.productList(pDto);
		
		
		model.addAttribute("dtos",productList);
		model.addAttribute("pageDto",pDto);
		
		return "admin/prod_list";
	}

}
