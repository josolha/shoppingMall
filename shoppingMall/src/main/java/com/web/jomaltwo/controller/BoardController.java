package com.web.jomaltwo.controller;



import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.jomaltwo.model.BoardDTO;
import com.web.jomaltwo.model.PageDTO;
import com.web.jomaltwo.service.BoardService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	

	@Autowired
	private BoardService bService;
	
	@RequestMapping("/list.do")
	public String list(PageDTO pDto, Model model) {
		
		List<BoardDTO> list =bService.boardList(pDto);
		
		model.addAttribute("bDto",list);
		model.addAttribute("pageDto",pDto);
		
		return "board/board_list";
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.GET)
	public String registerForm() {
		return "board/board_register";
	}
	
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String BoardAdd(BoardDTO dto) {	
	
		log.info(">>>>>>>>>>>>>DTO = "+dto+"<<<<<<<<<<<<<<<<");
		bService.boardAdd(dto);
		
		return "redirect:/board/list.do";
	}
	@RequestMapping("/view.do")
	public String view(int bid,@ModelAttribute("pDto") PageDTO pDto, Model model) {
		
		BoardDTO dto = bService.view(bid,"view");
		System.out.println(dto);
		model.addAttribute("dto",dto);
		
		return "board/board_view";
	}
}
