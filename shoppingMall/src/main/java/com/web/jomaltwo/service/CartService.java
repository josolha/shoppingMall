package com.web.jomaltwo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.ProductDTO;

public interface CartService {
	public int cartAdd(CartDTO dto);
	
	public List<CartDTO> getCartList(String userId);
	
	public int cartUpdate(int product_id, int product_cnt,HttpServletRequest request);

}
