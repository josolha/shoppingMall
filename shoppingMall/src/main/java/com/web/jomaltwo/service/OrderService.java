package com.web.jomaltwo.service;

import com.web.jomaltwo.model.OrderInfoDTO;
import com.web.jomaltwo.model.PaymentInfoDTO;
import com.web.jomaltwo.model.ProductDTO;

public interface OrderService {
	
	public int orderInsert(OrderInfoDTO dto);

}
