package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.PageDao;
import DTO.Board;

@Service
public class PageService {
	@Autowired
	private PageDao dao;
	
	//���ۼ�
	public int insert(Board board) {
		return dao.insert(board);
	}
	
	//�� ���
	public List<Board> getBoardList() {
		return dao.getBoardList();
	}
}
