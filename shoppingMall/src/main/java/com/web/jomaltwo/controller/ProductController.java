package com.web.jomaltwo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.service.CategoryService;
import com.web.jomaltwo.service.ProductService;
import com.web.jomaltwo.util.ProdSpec;

@Controller
public class ProductController {
	
	@Autowired
	private CategoryService service;
	
	@Autowired
	private ProductService pService;
	
	@RequestMapping("/productList.do")
	public String productList() {
		return "admin/prod_list";
	}
	
	@RequestMapping("/productInput.do")
	public String productRegisterfrom(Model model) {
	    // 카테고리 리스트 담기
	    List<CategoryDTO> cDtos = service.categoryList();
	    model.addAttribute("categoryList", cDtos);

	    // 등급 Enum 담기
	    ProdSpec[] pdSpecs = ProdSpec.values();
	    model.addAttribute("pdSpecs", pdSpecs);
		
		return "admin/prod_input";
	}
	
	
//	@RequestMapping("/productAdd.do")
//	public String productRegister(@RequestParam("file") MultipartFile file, @ModelAttribute ProductDTO dto, HttpServletRequest request, Model model) throws IOException {
//
//	    String fileName = file.getOriginalFilename();
//	    
//	    if (!fileName.isEmpty()) {
//	    	
//    	String UPLOAD_DIR = "resources/file_repo";	
//    	
//    	ServletContext servletContext = request.getSession().getServletContext();
//    	
//    	System.out.println(servletContext.getRealPath(""));
//    	
//    	String uploadPath = servletContext.getRealPath("")+File.separator+UPLOAD_DIR;
//    	
//	        File uploadDir = new File(uploadPath);
//	        
//	        if (!uploadDir.exists()) {
//	            uploadDir.mkdirs();
//	        }
//	        
//	        File uploadFile = new File(uploadPath + File.separator + fileName);
//	        
//	        if (uploadFile.exists()) {
//	            fileName = System.currentTimeMillis() + "_" + fileName;
//	            uploadFile = new File(uploadPath + File.separator + fileName);
//	        }
//	        
//	        file.transferTo(uploadFile);
//	        
//		    dto.setPImage(fileName); 
//		    
//		    pService.productInsert(dto);
//		    
//		    return "redirect:productList.do";
//    	}
	    
	    @RequestMapping("/productAdd.do")
	    public String productRegister(@RequestParam("file") MultipartFile file, @ModelAttribute ProductDTO dto,HttpServletRequest request, Model model) throws Exception {
	        if (!file.isEmpty()) {
	            pService.uploadFile(file,request);
	            dto.setPImage(file.getOriginalFilename());
	        }
//	        이미지가 null 일때 처리해야함..더 고민해보자
	        pService.productInsert(dto);
	        return "redirect:productList.do";
	    }

}
