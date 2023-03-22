package com.web.jomaltwo.service;

import com.web.jomaltwo.model.ReplyDTO;
import com.web.jomaltwo.model.ReplyPageDTO;

public interface ReplyService {
	int register(ReplyDTO rDto);
	
	ReplyDTO read(int rno);
	
	int remove(int rno);
	
	int modify(ReplyDTO rDto);
	
//	List<ReplyDTO> getList(Integer bid);
	ReplyPageDTO getList(Integer bid, Integer viewPage);
	
	int replyCnt(Integer bid);
}
