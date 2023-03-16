package com.web.jomaltwo.mapper;

import java.util.List;

import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.PageDTO;

public interface CategoryMapper {
	
	
	public int categoryInput(CategoryDTO dto);
	
	public List<CategoryDTO> categoryShow(PageDTO pDto);
	
	public List<CategoryDTO> categoryAllShow();
	
	public int categoryDelete(int cate_num);
	
	public int categoryUpdate(CategoryDTO dto);
	
	public int totalCnt(PageDTO pDto);

}
