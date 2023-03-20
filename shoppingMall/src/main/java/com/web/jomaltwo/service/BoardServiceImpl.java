package com.web.jomaltwo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.jomaltwo.mapper.BoardMapper;

import com.web.jomaltwo.model.BoardDTO;

import com.web.jomaltwo.model.PageDTO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;

	@Override
	public List<BoardDTO> boardAllList() {
		return mapper.boardAllShow();
	}
	
	public List<BoardDTO> boardList(PageDTO pDto){
		
		int totalCnt = mapper.totalCnt(pDto);
		
		pDto.setValue(totalCnt, pDto.getCntPerPage());
	
		return mapper.boardShow(pDto);
	}

	@Override
	public int boardAdd(BoardDTO dto) {
		return mapper.boardInput(dto);
	}

	@Override
	public BoardDTO view(int bid,String mode) {
		if(mode.equals("view")) {
			//조회수 증가
			mapper.hitAdd(bid);
		}
		return mapper.view(bid);
	}

}
