package com.web.jomaltwo.service;

import java.util.List;

import com.web.jomaltwo.model.BoardDTO;
import com.web.jomaltwo.model.CategoryDTO;
import com.web.jomaltwo.model.PageDTO;

public interface BoardService {
	
	public List<BoardDTO> boardAllList();
	
	public List<BoardDTO> boardList(PageDTO pDto);
	
	public int boardAdd(BoardDTO dto);
	
	public BoardDTO view(int bid,String mode);

}
