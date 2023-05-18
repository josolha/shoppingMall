package com.web.jomaltwo.model;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentHistoryDTO {
	
	private String productName;
	private Date purchaseDate;
	private int purchaseQuantity;
	private int purchasePrice;
	private String purchaseStatus;

}
