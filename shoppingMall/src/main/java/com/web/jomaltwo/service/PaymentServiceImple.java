package com.web.jomaltwo.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.jomaltwo.mapper.CartMapper;
import com.web.jomaltwo.mapper.OrderItemsMapper;
import com.web.jomaltwo.mapper.OrderMapper;
import com.web.jomaltwo.mapper.PaymentMapper;
import com.web.jomaltwo.mapper.PointMapper;
import com.web.jomaltwo.mapper.ProductMapper;
import com.web.jomaltwo.model.OrderItemsDTO;
import com.web.jomaltwo.model.PaymentInfoDTO;


@Service
public class PaymentServiceImple implements PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper;
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private PointMapper pointMapper;
	
	@Autowired
	private OrderItemsMapper orderItemsMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private CartMapper cartMapper;
	

	@Override
	@Transactional
	public int createOrderAndPaymentAndPointAndItems(PaymentInfoDTO dto) {
		
		orderMapper.orderInsert(dto.getOrderInfo()); // 주문 정보 저장
		
		
		
		paymentMapper.paymentInsert(dto); // 결제 정보 저장
		
		
		dto.getPointInfo().setPoint_amount(dto.getEarn_points()); // 사용 포인트 세팅
		
		
		pointMapper.pointInsert(dto.getPointInfo()); // 포인트 정보 저장
		
		
        for(OrderItemsDTO item : dto.getOrderItems()){
        	orderItemsMapper.orderItemsInsert(item); // 주문 항목들 저장
        	productMapper.decreaseStock(item);
        }
        
        cartMapper.deleteCartItems(dto.getOrderInfo().getMember_id());
		
		return 0;
	}
				

			

		
	

}
