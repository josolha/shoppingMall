package com.web.jomaltwo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.CategoryMapper;
import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.PageDTO;


@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryMapper mapper;
	
	
	@Override
	public int categoryAdd(CategoryDTO dto) {
		
		return mapper.categoryInput(dto);
	}


	@Override
	public List<CategoryDTO> categoryList(PageDTO pDto) {
		
		int totalCnt = mapper.totalCnt(pDto);
		
		pDto.setCntPerPage(5);
		
		pDto.setValue(totalCnt, pDto.getCntPerPage());
	
		return mapper.categoryShow(pDto);
	}


	@Override
	public int categoryRemove(int cate_num) {
		return mapper.categoryDelete(cate_num);
	}


	@Override
	public int categoryModify(CategoryDTO dto) {
		
		return mapper.categoryUpdate(dto);
	}


	@Override
	public List<CategoryDTO> categoryAllList() {
		// TODO Auto-generated method stub
		return mapper.categoryAllShow();
	}

}
