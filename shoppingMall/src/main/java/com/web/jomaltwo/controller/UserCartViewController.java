package com.web.jomaltwo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.CartService;
import com.web.jomaltwo.service.ProductService;
import com.web.jomaltwo.service.UserService;

@Controller
@RequestMapping("/user")
public class UserCartViewController {
    
    @Autowired
    private CartService cService;
    
    @Autowired
    private ProductService pService;
    


    @GetMapping("/cart")
    public String getCartList(Model model,@SessionAttribute("loginDto") UserDTO loginDto) {
    	

    	List<CartDTO> cartList = cService.getCartList(loginDto.getId());
    	
    	System.out.println(cartList);
    	// product에 담기해야함.
    	
		for (CartDTO cart : cartList) {
			ProductDTO product = pService.productInfo(cart.getProduct_id());
			cart.setProduct(product);
		}
    	System.out.println(cartList);
    	
  
    	model.addAttribute("cartList",cartList);
        return "user/user_cart_list";
    }
//    @GetMapping("")
    
    
}