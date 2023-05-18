package com.web.jomaltwo.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.ProductDTO;
import com.web.jomaltwo.service.CategoryService;
import com.web.jomaltwo.service.ProductService;
import com.web.jomaltwo.util.ProdSpec;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Slf4j
@Controller
public class ProductController {
	
	@Autowired
	private CategoryService service;
	
	@Autowired
	private ProductService pService;
	
	
	@RequestMapping("/productList.do")
	public String productList(PageDTO pDto,Model model) {
		log.info(">>>>>>>>>>>>>This is an info message.<<<<<<<<<<<<<");
		List<ProductDTO> productList = pService.productList(pDto);
//		System.out.println(pDto.getStartRowNum());
		model.addAttribute("dtos",productList);
		model.addAttribute("pageDto",pDto);
		
		return "admin/prod_list";
	}
	
	@RequestMapping("/productInput.do")
	public String productRegisterfrom(Model model) {
	    // 카테고리 리스트 담기
	    List<CategoryDTO> cDtos = service.categoryAllList();
	    model.addAttribute("categoryList", cDtos);

	    // 등급 Enum 담기
	    ProdSpec[] pdSpecs = ProdSpec.values();
	    System.out.println(pdSpecs);
	    
	    model.addAttribute("pdSpecs", pdSpecs);
		
		return "admin/prod_input";
	}
		    
    @RequestMapping("/productAdd.do")
    public String productRegister(@RequestParam("file") MultipartFile file, @ModelAttribute ProductDTO dto,HttpServletRequest request, Model model) throws Exception {
        if (!file.isEmpty()) {
            File uploadedFile = pService.uploadFile(file,request);
            dto.setPImage(uploadedFile.getName());
        }
//	        이미지가 null 일때 처리해야함..더 고민해보자
        pService.productInsert(dto);
        return "redirect:productList.do";
    }
    
    @RequestMapping("/productDel.do")
    public String productDelete(HttpServletRequest request,int pNum ,String pImage) throws Exception {
    	if(!pImage.isEmpty()) {
    		pService.deleteFile(request, pImage);
    	}
    	int cnt = pService.productRemove(pNum);
    	
    	return "redirect:productList.do";
    }
    
    @RequestMapping("/productUpdate.do")
    public String productUpdate(Model model,int pNum,@ModelAttribute("pageDto") PageDTO pageDto, int rowNum) {
    		
    	ProductDTO productInfo = pService.productInfo(pNum);
    	
    	System.out.println(productInfo);
    	model.addAttribute("pDto",productInfo);
    	
    	
    	List<CategoryDTO> cDtos = service.categoryAllList();
    	model.addAttribute("categoryList", cDtos);
    	
    	ProdSpec[] pdSpecs = ProdSpec.values();
 	    model.addAttribute("pdSpecs", pdSpecs);
 	    
 	    model.addAttribute("rowNum",rowNum);
 	    
 	    model.addAttribute("pageDto",pageDto);
 	    
    	
    	return "admin/prod_update";
    }
    
    @RequestMapping("/productUpdateOk.do")
    public String productUpdateOk(@RequestParam("file") MultipartFile file, @ModelAttribute ProductDTO dto,HttpServletRequest request, Model model) throws Exception {
    	
    	String pImage = file.getOriginalFilename();
    	
//    	System.out.println("새로운 이미지 :"+pImage);
    	
//    	System.out.println("기존 이미지 :"+ dto.getPImage());
    	
    	if(pImage == "") {
    		int cnt = pService.productModify(dto);
    	}
    	else {
    		File uploadedFile = pService.uploadFile(file,request);
            dto.setPImage(uploadedFile.getName());
		    int cnt = pService.productModify(dto);
    	}
	    	
    	System.out.println("수정완료");
    	return "redirect:productList.do"; 
    }
    

}
