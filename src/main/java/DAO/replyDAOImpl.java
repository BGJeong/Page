package DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DTO.replyDTO;

@Repository
public class replyDAOImpl implements ReplyDAO {

	@Autowired
	private SqlSession sqlsession;
	@Override
	public int replyInsert(replyDTO dto) {
		return sqlsession.insert("replyns.insert_reply",dto);
	}
	@Override
	public ArrayList<replyDTO> getSelect(int bno) {
		ArrayList<replyDTO> list = (ArrayList) sqlsession.selectList("replyns.select_reply", bno);
		return list;
	}
	
}
