package com.web.jomaltwo.model;

import lombok.Data;

@Data
public class UserDTO {
	 private int no;
	 private String id;
	 private String pw;
	 private String name;
	 private int age;
	 private String email;
	 private String phone;
	   
	 private String zipcode;
	 private String road_addr;
	 private String jibun_addr;
	 private String detail_addr;   
}
