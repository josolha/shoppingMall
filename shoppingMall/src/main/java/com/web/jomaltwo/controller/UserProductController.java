package com.web.jomaltwo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.service.ProductService;

@Controller
@RequestMapping("/user")
public class UserProductController {
	
	@Autowired
	private ProductService pService;
	
	@RequestMapping(value= "products.do", method =RequestMethod.GET)
	public String UserProductList(Model model) {
		HashMap<String,List<ProductDTO>> map = pService.productBySpecs();
		model.addAttribute("map", map);
		
		return "user/user_prod_list";
		
	}
	@RequestMapping(value= "productView.do", method =RequestMethod.GET)
	public String UserProductView(int pNum,Model model) {
		
		ProductDTO pDto =pService.productInfo(pNum);
		model.addAttribute("pDto",pDto);
		
		return "user/user_prod_view";
		
	}
	
	

}
