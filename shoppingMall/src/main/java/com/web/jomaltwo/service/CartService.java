package com.web.jomaltwo.service;

import java.util.List;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.ProductDTO;

public interface CartService {
	public int cartAdd(CartDTO dto);
	
	public List<CartDTO> getCartList(String userId);

}
