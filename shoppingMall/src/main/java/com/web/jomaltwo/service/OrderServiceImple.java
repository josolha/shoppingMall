package com.web.jomaltwo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.OrderMapper;
import com.web.jomaltwo.mapper.PaymentMapper;
import com.web.jomaltwo.model.OrderInfoDTO;
import com.web.jomaltwo.model.PaymentInfoDTO;


@Service
public class OrderServiceImple implements OrderService{

		
	@Autowired
	private OrderMapper mapper;
	
	@Override
	public int orderInsert(OrderInfoDTO dto) {
		
		return mapper.orderInsert(dto);
	}
}
