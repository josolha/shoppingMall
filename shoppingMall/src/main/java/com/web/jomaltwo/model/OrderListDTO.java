package com.web.jomaltwo.model;

import java.util.Date;

import lombok.Data;


@Data
public class OrderListDTO {
	
	private String order_id;
    private String member_id;
    private String product_name;
    
    private Date order_date;
    private int amount;
    private String order_state;
    private String shipping_address;
    private String receiver_name;
    private String receiver_phone;

}
