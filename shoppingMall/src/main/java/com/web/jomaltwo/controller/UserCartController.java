package com.web.jomaltwo.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.jomaltwo.model.CartDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.model.UserDTO;
import com.web.jomaltwo.service.CartService;
import com.web.jomaltwo.service.ProductService;


@RestController
@RequestMapping("/cart")
public class UserCartController {
	
	@Autowired
	private CartService service;
	
    @Autowired
    private ProductService pService;
	
	//등록
	@PostMapping("/new")
	public ResponseEntity<String> cartAdd(@RequestBody CartDTO dto) {
		
		int resultCnt = service.cartAdd(dto);
		
		 return ResponseEntity.ok().build();
	}
	
	//수정
	@PutMapping("/{product_id}/{product_cnt}")
	public ResponseEntity<String> updateCart(@PathVariable int product_id, @PathVariable int product_cnt,HttpServletRequest request) {
	       
	    int resultCnt = service.cartUpdate(product_id,product_cnt,request);
	    
	    return ResponseEntity.ok().build();
	}
	
	//삭제
	@DeleteMapping("/{product_id}")
	public ResponseEntity<String> DeleteCart(@PathVariable int product_id,HttpServletRequest request){
		
		System.out.println(product_id);
		int resultCnt = service.cartDelete(product_id,request);
		
		return ResponseEntity.ok().build();
	}
	
	//결제 페이지(여러개) 삭제
	@PostMapping("/delete")
	public ResponseEntity<String> deleteProducts(@RequestBody List<String> prodNums,HttpServletRequest request) {
		
		//1.SessionAttribute로 바로가져올수있음.
//		public ResponseEntity<String> deleteProducts(@RequestBody List<String> prodNums,
//				  @SessionAttribute("userId") String userId) {
//				  // ...
//				}	
		
		//2.이렇게도 가능
//		String userId = (String) session.getAttribute("userId");
		
		//삭제 처리
		  for (String prodNum : prodNums) {
			  int resultCnt = service.cartDelete(Integer.parseInt(prodNum),request);
		  }

//		HttpSession session = request.getSession();
//	    UserDTO loginDto = (UserDTO) session.getAttribute("loginDto");
//	    List<CartDTO> cartList = service.getCartList(loginDto.getId());
//	    
//		for (CartDTO cart : cartList) {
//			ProductDTO product = pService.productInfo(cart.getProduct_id());
//			cart.setProduct(product);
//		}
//	    
//	    System.out.println(cartList);

	    // 삭제 성공 응답을 반환한다.
		return ResponseEntity.ok().build();
	}
	
}
