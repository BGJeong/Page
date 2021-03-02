package service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.replyDAOImpl;
import DTO.replyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private replyDAOImpl dao;
	
	public int replyInsert(replyDTO dto) {
		return dao.replyInsert(dto);
	}

	public ArrayList<replyDTO> getSelect(int bno) {
		return dao.getSelect(bno);
	}
	
}
