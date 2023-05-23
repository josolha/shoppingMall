package com.web.jomaltwo.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.PaymentHistoryDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.CategoryService;
import com.web.jomaltwo.service.PaymentHistoryService;
import com.web.jomaltwo.service.ProductService;
import com.web.jomaltwo.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class OrderController {
	
	@Autowired
	private PaymentHistoryService hService;
	
	
	@RequestMapping("/orderList.do")
	public String orderList(PageDTO pDto,Model model) {
		
		log.info("");
		
		List<PaymentHistoryDTO> PaymentHistoryDTO = hService.orderList(pDto);
		
		
		
		model.addAttribute("dtos",PaymentHistoryDTO);
		model.addAttribute("pageDto",pDto);
		
		log.info("시작일" + pDto.getStart_date() + "종료일" + pDto.getEnd_date());
		
		
		return "admin/order_list";
	}

}
