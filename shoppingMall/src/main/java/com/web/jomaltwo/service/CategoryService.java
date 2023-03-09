package com.web.jomaltwo.service;



import java.util.List;

import com.web.jomaltwo.model.CategoryDTO;


public interface CategoryService {
	
	public int categoryAdd(CategoryDTO dto);
	
	public List<CategoryDTO> categoryList();
	
	public int categoryRemove(int cate_num);
	
	public int categoryModify(CategoryDTO dto);

}
