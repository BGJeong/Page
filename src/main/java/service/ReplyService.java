package service;

import java.util.ArrayList;

import DTO.replyDTO;

public interface ReplyService {
	public int replyInsert(replyDTO dto);
	public ArrayList<replyDTO> getSelect(int bno);
}
