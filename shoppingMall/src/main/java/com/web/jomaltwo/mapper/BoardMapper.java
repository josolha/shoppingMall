package com.web.jomaltwo.mapper;

import java.util.List;

import com.web.jomaltwo.model.BoardDTO;
import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.model.ProductDTO;

public interface BoardMapper {
	
	public List<BoardDTO> boardAllShow();
	
	public List<BoardDTO> boardShow(PageDTO pDto);
	
	public int boardInput(BoardDTO dto);
	
	public int totalCnt(PageDTO pDto);
	
	public BoardDTO view(int bid);
	
	public void hitAdd(int bid);
	

}
