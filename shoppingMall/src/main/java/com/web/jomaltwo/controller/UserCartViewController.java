package com.web.jomaltwo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.CartService;
import com.web.jomaltwo.service.ProductService;

@Controller
public class UserCartViewController {
    
    @Autowired
    private CartService cService;
    
    @Autowired
    private ProductService pService;

    @GetMapping("/cart")
    public String getCartList(Model model,HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
    	UserDTO loginDto = (UserDTO) session.getAttribute("loginDto");
    	
    	System.out.println("<<<<<<<<<id : "+ loginDto.getId());
    	
    	List<CartDTO> cartList = cService.getCartList(loginDto.getId());
    	
    	System.out.println(cartList);
    	// product에 담기해야함.
    	
//		for (CartDTO cart : cartList) {
//			ProductDTO product = pService.getProduct(cart.getProduct_id());
//			cart.setProduct(product);
//		}
    	
    	
    	model.addAttribute("pDtos",cartList);
        return "user/user_cart_list";
    }
}