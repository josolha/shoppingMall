package com.web.jomaltwo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.jomaltwo.model.CartDTO;

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
//	@PutMapping("{id}")
//	public 
//	
//	
}
