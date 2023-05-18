package com.web.jomaltwo.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.jomaltwo.model.OrderItemsDTO;
import com.web.jomaltwo.model.PaymentInfoDTO;
import com.web.jomaltwo.service.OrderService;
import com.web.jomaltwo.service.PaymentService;

@RestController
@RequestMapping("/payments")

public class PaymentController {
	
	@Autowired
	private PaymentService pService;
	
	@Autowired
	private OrderService oService;
	
	
	

  // 결제 생성
  @PostMapping(produces = "application/json; charset=UTF-8")
  public ResponseEntity<String> createPayment(@RequestBody PaymentInfoDTO paymentInfo) {
	  
	  
	  System.out.println("====결제 정보====");
	  System.out.println("payment_id: " + paymentInfo.getPayment_id());
	  System.out.println("order_id : " + paymentInfo.getOrder_id());
	  System.out.println("payment_date: " + paymentInfo.getPaymentDate());
	  System.out.println("used_points: " + paymentInfo.getUsed_points());
	  System.out.println("amount: " + paymentInfo.getAmount());
	  System.out.println("payment_status: " + paymentInfo.getPayment_status());
	
	  
	  System.out.println("====주문 정보=====");
	  System.out.println("order_id : " + paymentInfo.getOrderInfo().getOrder_id());
	  System.out.println("member_id : " + paymentInfo.getOrderInfo().getMember_id());
	  System.out.println("total_amount : " + paymentInfo.getOrderInfo().getTotal_amount());
	  System.out.println("receiver_name : " + paymentInfo.getOrderInfo().getReceiver_name());
	  System.out.println("receiver_phone : " + paymentInfo.getOrderInfo().getReceiver_phone());
	  System.out.println("shipping_address : " + paymentInfo.getOrderInfo().getShipping_address());
	  
	  System.out.println("====포인트=====");
	  System.out.println("point_id :"+ paymentInfo.getPointInfo().getPoint_id());
	  System.out.println("member_id :"+ paymentInfo.getPointInfo().getMember_id());
	  System.out.println("payment_id : "+ paymentInfo.getPointInfo().getPayment_id());
	  System.out.println("point_amount: "+ paymentInfo.getPointInfo().getPoint_amount());
	  System.out.println("point_date:"+ paymentInfo.getPointInfo().getPoint_date());
	  
	  System.out.println("====아이템리스트=====");
	  for (OrderItemsDTO orderItem : paymentInfo.getOrderItems()) {
		  System.out.println("order_id: " + orderItem.getOrder_id()); // 각 항목을 원하는 형식으로 출력
		    System.out.println("product_id: " + orderItem.getProduct_id()); // 각 항목을 원하는 형식으로 출력
		    System.out.println("quantity: " + orderItem.getQuantity()); // 각 항목을 원하는 형식으로 출력
		}
	  
	  int cnt = pService.createOrderAndPaymentAndPointAndItems(paymentInfo);
	  
	  
	  
	 
    
    // 결제 정보를 처리하는 로직을 추가하여 데이터베이스에 저장 필요 .
	  
	//1. 주문테이블 저장

//	  int cnt = oService.orderInsert(paymentInfo.getOrderInfo());
	  
	  
	//2.주문 아이템 테이블 저장
	  
//	  for (OrderItemInfoDTO itemInfo : paymentInfo.getOrderInfo().getItems()) {
//		    int cnt2 = oiService.orderItemInsert(itemInfo);
//		  }
//	  
	  
	//3. 결제테이블 저장
	  
//	  int cnt2 = pService.paymentInsert(paymentInfo);
	  
    

    // 처리 결과에 따라 적절한 응답을 반환하십시오.
    return ResponseEntity.ok("결제 정보를 성공적으로 처리하였습니다.");
  }

  // 기타 필요한 메서드 및 로직 추가
}

