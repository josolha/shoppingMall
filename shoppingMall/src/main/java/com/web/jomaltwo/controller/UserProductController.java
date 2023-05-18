package com.web.jomaltwo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.ProductViewDTO;
import com.web.jomaltwo.service.ProductService;

@Controller
//@RequestMapping("/user")
public class UserProductController {
	
	@Autowired
	private ProductService pService;
	
	
	//모든 상품 보여주는곳 -> 사용자 메인
	@RequestMapping(value= "products.do", method =RequestMethod.GET)
	public String UserProductList(Model model, @RequestParam(defaultValue = "") String spec) {
		
		HashMap<String,List<ProductDTO>> map = pService.productBySpecs(spec);
		
		model.addAttribute("map", map);
		
		return "user/user_prod_list";
		
	}
	
	//상품상세 보기
	@RequestMapping(value= "productView.do", method =RequestMethod.GET)
	public String UserProductView(int pNum,Model model) {

	ProductDTO pDto =pService.productInfo(pNum);
	model.addAttribute("pDto",pDto);

		return "user/user_prod_view";
	}
	
	// 상품 분류하기 (카테코리, 스펙, 키워드 )
	@GetMapping("/products/{cate_code}/{spec}")
	public String productView(@PathVariable String cate_code, @PathVariable String spec,
			 				  @RequestParam(defaultValue = "") String keyWord,
			 				  @RequestParam(defaultValue = "8") int cntPerPage,
			 				  @RequestParam(defaultValue = "1") int viewPage,
			 				  Model model){
		
		System.out.println("viewPage :" + viewPage);
		
	   ProductViewDTO productView = ProductViewDTO.builder()
		            		.cate_code(cate_code)
		            		.spec(spec)
		            		.keyWord(keyWord)
		            		.cntPerPage(cntPerPage)
		            		.viewPage(viewPage)
		            		.build();
	   
	   System.out.println("프로덕트뷰 이전  : "+productView);
	   
	   ProductViewDTO result = pService.productView(productView);
	    
	    System.out.println("프로덕트뷰 : "+result);
	   
	    model.addAttribute("pdView", result);
	    
	    model.addAttribute("pageDto", productView);
	    model.addAttribute("cate_code", cate_code);

	    return "user/user_prod_list";
	}
}
