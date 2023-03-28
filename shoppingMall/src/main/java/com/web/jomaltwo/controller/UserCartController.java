package com.web.jomaltwo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.CartService;


@RestController
@RequestMapping("/cart")
public class UserCartController {
	
	@Autowired
	private CartService service;
	
	@PostMapping("/new")
	public String cartAdd(@RequestBody CartDTO dto) {
		
		int resultCnt = service.cartAdd(dto);
		
		return resultCnt == 1 ? "success" : "fail"; 
	}
	
	
	@PutMapping("/{product_id}/{product_cnt}")
	public ResponseEntity<String> updateCart(@PathVariable int product_id, @PathVariable int product_cnt,HttpServletRequest request) {
	    
	    System.out.println(product_id);
	    System.out.println(product_cnt);
//	    System.out.println(cart.getProduct_cnt());
	   	    
	    int resultCnt = service.cartUpdate(product_id,product_cnt,request);
	    
//	    cart.setUser_id(loginDto.getId());
//	    cart.setProduct_id(pNum);
	    
	    
	    return ResponseEntity.ok().build();
	}
}
