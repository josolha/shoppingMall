package com.web.jomaltwo.service;

import java.util.List;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.PaymentHistoryDTO;

public interface PaymentHistoryService {
	
	public List<PaymentHistoryDTO> getPaymentHistory(String paymentId);
	
	public List<PaymentHistoryDTO> orderList(PageDTO pDto);

}
