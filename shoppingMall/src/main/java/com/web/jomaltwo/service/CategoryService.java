package com.web.jomaltwo.service;



import java.util.List;

import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.PageDTO;


public interface CategoryService {
	
	public int categoryAdd(CategoryDTO dto);
	
	public List<CategoryDTO> categoryList(PageDTO dto);
	
	public List<CategoryDTO> categoryAllList();
	
	public int categoryRemove(int cate_num);
	
	public int categoryModify(CategoryDTO pDto);

}
