package com.web.jomaltwo.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;


import lombok.Data;


@Data
public class PaymentInfoDTO {
	  private String payment_id;
	  private String order_id;
	  private Date paymentDate;
	  private int used_points;
	  private int earn_points;
	  private int amount;
	  private String payment_status;
	  private OrderInfoDTO orderInfo;
	  private PointDTO pointInfo;
	  private ArrayList<OrderItemsDTO> orderItems;
	  
}
