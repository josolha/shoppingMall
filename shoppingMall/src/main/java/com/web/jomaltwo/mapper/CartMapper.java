package com.web.jomaltwo.mapper;

import java.util.List;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.ProductDTO;

public interface CartMapper {
	
	public int cartInput(CartDTO dto);
	
	public List<CartDTO> getCartList(String userId);
	
	public int cartUpdate(CartDTO dto);

}
