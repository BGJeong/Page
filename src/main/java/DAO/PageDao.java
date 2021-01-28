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

	// 占쏙옙占쌜쇽옙
	public int insert(Board board) {
		return session.insert("insert", board);
	}

	// 占쌜몌옙占�
	public ArrayList<Board> getBoardList(String id) {
		return (ArrayList) session.selectList("list", id);
	}

	public Board board_conf(int no) {
		return (Board) session.selectOne("listno", no);
	}
	//getboard
	public Board getboard(int no) {
		return session.selectOne("boardns.content", no);
	}
	//update
	public int update(Board board) {
		return session.update("boardns.update", board);
	}
	
	//delete
	public int delete(int no) {
		return session.delete("boardns.delete", no);
	}
}
