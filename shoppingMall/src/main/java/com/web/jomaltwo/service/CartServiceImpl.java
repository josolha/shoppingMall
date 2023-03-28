package com.web.jomaltwo.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.CartMapper;
import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.UserDTO;


@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper mapper;
	
	@Autowired
	private CartDTO cartDTO;

	@Override
	public int cartAdd(CartDTO dto) {
		// TODO Auto-generated method stub
		return mapper.cartInput(dto);
	}

	@Override
	public List<CartDTO> getCartList(String userId) {
		
		return mapper.getCartList(userId);
	}

	@Override
	public int cartUpdate(int product_id, int product_cnt,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
    	UserDTO loginDto = (UserDTO) session.getAttribute("loginDto");
    	
    	cartDTO.setUser_id(loginDto.getId());  
		cartDTO.setProduct_id(product_id);
		cartDTO.setProduct_cnt(product_cnt);
		
		return mapper.cartUpdate(cartDTO);
	}

	@Override
	public int cartDelete(int product_id, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		UserDTO loginDto = (UserDTO) session.getAttribute("loginDto");
		
		cartDTO.setUser_id(loginDto.getId());
		cartDTO.setProduct_id(product_id);
		
		
		return mapper.cartDelete(cartDTO);
	}

	

}
