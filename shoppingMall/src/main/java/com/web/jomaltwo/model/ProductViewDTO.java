package com.web.jomaltwo.model;

import java.util.List;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ProductViewDTO {
	private String spec;
	private String cate_code;
	private String cate_name;
	private List<ProductDTO> product;
	private String keyWord;

}

