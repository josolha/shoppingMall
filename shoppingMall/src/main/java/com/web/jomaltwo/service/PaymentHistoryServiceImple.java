package com.web.jomaltwo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.CategoryMapper;
import com.web.jomaltwo.mapper.PaymentHistoryMapper;
import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.PaymentHistoryDTO;

@Service
public class PaymentHistoryServiceImple implements PaymentHistoryService{
	
	@Autowired
	private PaymentHistoryMapper mapper;

	@Override
	public List<PaymentHistoryDTO> getPaymentHistory(String paymentId) {
		
		return mapper.getPaymentHistory(paymentId);
	}

	@Override
	public List<PaymentHistoryDTO> orderList(PageDTO pDto) {
		
	int totalCnt = mapper.totalCnt(pDto);
	
	System.out.println("씨엔티 :"+ totalCnt);
		
		pDto.setValue(totalCnt, pDto.getCntPerPage());
		
		
		return mapper.getAllPaymentHistory(pDto);
	}

}
