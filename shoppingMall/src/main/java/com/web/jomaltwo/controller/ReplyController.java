package com.web.jomaltwo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.web.jomaltwo.model.ReplyDTO;
import com.web.jomaltwo.model.ReplyPageDTO;
import com.web.jomaltwo.service.ReplyService;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@RestController 
@RequestMapping("/replies")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	// 댓글조회
	@GetMapping("/{rno}")
	public ReplyDTO get(@PathVariable("rno") int rno) {
		System.out.println("rno : " + rno);
		
		return service.read(rno);
	}
	
	// 댓글추가
	@PostMapping("/new")
	public String create(@RequestBody ReplyDTO rDto) {
		int resultCnt = service.register(rDto);
		log.info("+++++++++++++++++rDto :"+rDto);
		
		return resultCnt == 1 ? "success" : "fail"; 
	}

	// 댓글삭제
	@DeleteMapping("/{rno}")
	public String remove(@PathVariable("rno") int rno) {		
		int resultCnt = service.remove(rno);
		
		return resultCnt == 1 ? "success" : "fail"; 
	}
	
	// 댓글수정
	@RequestMapping(value="/{rno}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public String modify(@PathVariable("rno") int rno, @RequestBody ReplyDTO rDto) {		
		rDto.setRno(rno);
		
		int resultCnt = service.modify(rDto);	
		return resultCnt == 1 ? "success" : "fail"; 
	}
	
	
	// 페이징 처리가 된 댓글 리스트 조회
	@GetMapping("list/{bid}/{viewPage}")
	public ReplyPageDTO getList(@PathVariable("bid") Integer bid, 
			@PathVariable("viewPage") Integer viewPage){
		
		ReplyPageDTO rPageDto=service.getList(bid, viewPage);
		System.out.println("rPageDto : " + rPageDto);
		
		return rPageDto;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
