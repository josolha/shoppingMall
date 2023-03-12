package com.web.jomaltwo.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDTO {
		private int pNum;
		private String pName;
		private String pCategory_fk;
		private String pCompany;
		private String pImage;
		private int pQty;
		private int price;
		private String pSpec;
		private String pContent;
		private int pPoint;
		private Date pInputDate;
		
		
		private int totPrice;
		private int totPoint;
}
