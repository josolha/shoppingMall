package com.web.jomaltwo.mapper;

import java.util.List;

import com.web.jomaltwo.model.CategoryDTO;

public interface CategoryMapper {
	
	
	public int categoryInput(CategoryDTO dto);
	
	public List<CategoryDTO> categoryShow();
	
	public int categoryDelete(int cate_num);

}
