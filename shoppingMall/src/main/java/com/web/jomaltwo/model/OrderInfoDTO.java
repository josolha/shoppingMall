package com.web.jomaltwo.model;

import java.math.BigDecimal;
import java.util.Date;

import lombok.Data;

@Data
public class OrderInfoDTO {
	private String order_id;
    private String member_id;
    private Date order_date;
    private int total_amount;
    private String receiver_name;
    private String receiver_phone;
    private String shipping_address;
}
