package com.web.jomaltwo.model;

import java.sql.Date;

import lombok.Data;

@Data
public class CartDTO {
	private int cart_id;
	private String user_id;
	private int product_id;
	private int product_cnt;
	private Date regDate;
	
	
	private ProductDTO product;
}
