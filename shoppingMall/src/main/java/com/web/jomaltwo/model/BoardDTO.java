package com.web.jomaltwo.model;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDTO {
	
	private int bid;
	private String subject;
	private String contents;
	private int hit;
	private String writer;
	private Date regDate;

}
