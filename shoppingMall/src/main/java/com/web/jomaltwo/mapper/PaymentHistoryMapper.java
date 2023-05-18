package com.web.jomaltwo.mapper;

import java.util.List;

import com.web.jomaltwo.model.PaymentHistoryDTO;

public interface PaymentHistoryMapper {
	
	public List<PaymentHistoryDTO> getPaymentHistory(String paymentId);

}
