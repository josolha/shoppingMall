package com.web.jomaltwo.model;

import java.util.Date;

import lombok.Data;


@Data
public class PointDTO {
	private int point_id;
	private String member_id;
	private String payment_id;
	private int point_amount;
	private Date point_date;
}
