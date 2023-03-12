package com.web.jomaltwo.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.ProductDTO;

public interface ProductService {
	
	public int productInsert(ProductDTO dto);
	
	public void uploadFile(MultipartFile file, HttpServletRequest request) throws Exception;
	
	public List<ProductDTO> productList();
	
	public int productRemove(int pNum);
	
	public void deleteFile(HttpServletRequest request,String pImage) throws Exception;

}
