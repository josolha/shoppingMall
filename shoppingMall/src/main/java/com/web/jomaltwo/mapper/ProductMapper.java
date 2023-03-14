package com.web.jomaltwo.mapper;

import java.util.List;

import com.web.jomaltwo.model.ProductDTO;

public interface ProductMapper {
	
	public int productInput(ProductDTO dto);
	
	public List<ProductDTO> productShow();
	
	public int productDelete(int pNum);
	
	public ProductDTO productInfo(int pNum);
	
	public int productUpdate(ProductDTO dto);

}
