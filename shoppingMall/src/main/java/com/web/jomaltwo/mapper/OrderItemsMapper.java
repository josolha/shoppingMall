package com.web.jomaltwo.mapper;

import com.web.jomaltwo.model.OrderInfoDTO;
import com.web.jomaltwo.model.OrderItemsDTO;
import com.web.jomaltwo.model.PaymentInfoDTO;

public interface OrderItemsMapper {
	
	public int orderItemsInsert(OrderItemsDTO dto);

}
