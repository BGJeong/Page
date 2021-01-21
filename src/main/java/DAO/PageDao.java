package DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DTO.Board;



@Repository
public class PageDao {
	
	@Autowired
	private SqlSession session;
	
	//���ۼ�
	public int insert(Board board) {
		return session.insert("insert", board);
	}
	
	//�۸��
	public ArrayList<Board> getBoardList(String id){
		return (ArrayList)session.selectList("list", id);
	}
}
