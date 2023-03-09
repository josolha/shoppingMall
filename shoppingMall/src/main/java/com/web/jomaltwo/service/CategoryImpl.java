package com.web.jomaltwo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.CategoryMapper;
import com.web.jomaltwo.model.CategoryDTO;


@Service
public class CategoryImpl implements CategoryService {
	
	@Autowired
	private CategoryMapper mapper;
	
	
	@Override
	public int categoryAdd(CategoryDTO dto) {
		
		return mapper.categoryInput(dto);
	}


	@Override
	public List<CategoryDTO> categoryList() {
	
		return mapper.categoryShow();
	}


	@Override
	public int categoryRemove(int cate_num) {
		return mapper.categoryDelete(cate_num);
	}

}
