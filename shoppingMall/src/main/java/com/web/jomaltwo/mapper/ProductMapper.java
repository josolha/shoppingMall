package com.web.jomaltwo.mapper;

import java.util.List;

import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.ProductDTO;

public interface ProductMapper {
	
	public int productInput(ProductDTO dto);
	
	public List<ProductDTO> productAllShow();
	
	public List<ProductDTO> productShow(PageDTO pDto);
	
	public int productDelete(int pNum);
	
	public ProductDTO productInfo(int pNum);
	
	public int productUpdate(ProductDTO dto);
	
	public List<ProductDTO> productBySpec(String spec);
	
	public int totalCnt(PageDTO pDto);
}
