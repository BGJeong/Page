package DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DTO.LikeyDTO;

@Repository
public class LikeyDAOImpl implements LikeyDAO {
	@Autowired
	private SqlSession sqlsession;
	public LikeyDTO likecheck(LikeyDTO dto) {
		return sqlsession.selectOne("likeyns.likecheck", dto);
	}
	public void delete_like(LikeyDTO dto){
		sqlsession.selectOne("likeyns.delete_like", dto);
	}
	public void insert_like(LikeyDTO dto){
		sqlsession.selectOne("likeyns.insert_like", dto);
	}
	public ArrayList<LikeyDTO> totalLike(LikeyDTO dto){
		ArrayList<LikeyDTO> list = (ArrayList)sqlsession.selectList("likeyns.totalLike", dto); 
		return list;
	}
}
