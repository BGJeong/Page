package DAO;

import java.util.ArrayList;

import DTO.replyDTO;

public interface ReplyDAO {
	public int replyInsert(replyDTO dto);
	public ArrayList<replyDTO> getSelect(int bno);
}
