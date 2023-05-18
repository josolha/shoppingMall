package com.web.jomaltwo.model;

import lombok.Data;

@Data
public class OrderItemsDTO {
	
	private int order_items_id;
	private String order_id;
	private int product_id;
	private int quantity;
}
