package com.web.jomaltwo.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.OrderItemsDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.CartService;
import com.web.jomaltwo.service.PointService;
import com.web.jomaltwo.service.ProductService;
import com.web.jomaltwo.service.UserService;

@Controller
@RequestMapping("/user")
public class UserCheckOutViewController {
	
	@Autowired
    private CartService cService;
	    
    @Autowired
    private ProductService pService;
	
	@Autowired
	private UserService uService;
	
	@Autowired
	private PointService pointService;
	
	@RequestMapping("/checkout.do")
    public String checkOut(Model model,@SessionAttribute("loginDto") UserDTO loginDto) {
		
		UserDTO dto = uService.userInfo(loginDto.getId());
		model.addAttribute("UserDto",dto);
		
    	List<CartDTO> cartList = cService.getCartList(loginDto.getId());
    	
    	System.out.println(cartList);
    	// product에 담기해야함.
    	
    	
    	List<OrderItemsDTO> orderItems = new ArrayList<>();
    	
    	
		for (CartDTO cart : cartList) {
			ProductDTO product = pService.productInfo(cart.getProduct_id());
			
			OrderItemsDTO orderItem = new OrderItemsDTO();
			
			orderItem.setProduct_id(cart.getProduct_id());
			orderItem.setQuantity(cart.getProduct_cnt());
			
			orderItems.add(orderItem);
			
			cart.setProduct(product);
		}
		
		int totalPoint = pointService.checkPoint(loginDto.getId());
		
    	System.out.println("카트리스트 :"+ cartList);
    	System.out.println("orderItems"+cartList);
    	model.addAttribute("cartList",cartList);
    	model.addAttribute("orderItems",orderItems);
    	model.addAttribute("UserDto",dto);
    	model.addAttribute("totalPoint",totalPoint);
    	
		
    	return "user/user_check_out";
    }
	
	
	//  필요한 객체 
	//	request.setAttribute("pDtos", pDtos);
	//  request.setAttribute("mDto", mDto);
	
	

}
