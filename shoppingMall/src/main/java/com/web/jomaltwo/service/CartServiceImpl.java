package com.web.jomaltwo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.CartMapper;
import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.ProductDTO;


@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper mapper;

	@Override
	public int cartAdd(CartDTO dto) {
		// TODO Auto-generated method stub
		return mapper.cartInput(dto);
	}

	@Override
	public List<CartDTO> getCartList(String userId) {
		
		return mapper.getCartList(userId);
	}

}
