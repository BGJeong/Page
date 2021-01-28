package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.PageDao;
import DTO.Board;

@Service
public class PageService {
	@Autowired
	private PageDao dao;
	
	//占쏙옙占쌜쇽옙
	public int insert(Board board) {
		return dao.insert(board);
	}
	
	//占쏙옙 占쏙옙占�
	public ArrayList<Board> getBoardList(String id) {
		return dao.getBoardList(id);
	}
	public Board board_conf(int no){
		return dao.board_conf(no);
	}
	//getboard
	public Board getboard(int no) {
		return dao.getboard(no);
	}
		
	//update
	public int update(Board board) {
		return dao.update(board);
	}
	
	//delete
	public int delete(int no) {
		return dao.delete(no);
	}
}
