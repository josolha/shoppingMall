package com.web.jomaltwo.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.jomaltwo.mapper.CategoryMapper;
import com.web.jomaltwo.mapper.ProductMapper;
import com.web.jomaltwo.model.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper mapper;

	@Override
	public int productInsert(ProductDTO dto) {
		
		return mapper.productInput(dto);
	}

	@Override
	public File uploadFile(MultipartFile file, HttpServletRequest request) throws Exception {
		
		String fileName = file.getOriginalFilename();
		
		String UPLOAD_DIR = "resources/file_repo";	
    	
    	ServletContext servletContext = request.getSession().getServletContext();
    	
//    	System.out.println(servletContext.getRealPath(""));
    	
    	String uploadPath = servletContext.getRealPath("")+File.separator+UPLOAD_DIR;
    	
	        File uploadDir = new File(uploadPath);
	        
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }
	        
	        File uploadFile = new File(uploadPath + File.separator + fileName);
	        
	        if (uploadFile.exists()) {
	            fileName = System.currentTimeMillis() + "_" + fileName;
	            uploadFile = new File(uploadPath + File.separator + fileName);
	        }
			file.transferTo(uploadFile);
			return uploadFile;			
	}

	@Override
	public List<ProductDTO> productList() {
		
		return mapper.productShow();
	}

	@Override
	public int productRemove(int pNum) {
		
		return mapper.productDelete(pNum);
	}

	@Override
	public void deleteFile(HttpServletRequest request,String pImage) throws Exception {
		
		String FILE_DIR = "resources/file_repo";	
    	
    	ServletContext servletContext = request.getSession().getServletContext();
    	
    	String FilePath = servletContext.getRealPath("")+File.separator+FILE_DIR;
    	
    	File delFile = null;
    	
		if(pImage != null) {
			delFile = new File(FilePath+ File.separator+pImage);
			if(delFile.exists()) { 
				if(delFile.delete());
			}
		}
    	
	}

	@Override
	public ProductDTO productInfo(int pNum) {
		
		return mapper.productInfo(pNum);
	}

	@Override
	public int productModify(ProductDTO dto) {
		
		return mapper.productUpdate(dto);
	}
	
}