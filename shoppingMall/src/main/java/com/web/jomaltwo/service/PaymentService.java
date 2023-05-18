package com.web.jomaltwo.service;

import com.web.jomaltwo.model.PaymentInfoDTO;
import com.web.jomaltwo.model.ProductDTO;

public interface PaymentService {
	
	public int createOrderAndPaymentAndPointAndItems(PaymentInfoDTO dto);

}
