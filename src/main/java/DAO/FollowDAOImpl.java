package DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DTO.FollowDTO;

@Repository
public class FollowDAOImpl implements FollowDAO{

	@Autowired
	private SqlSession sqlsession;
	public ArrayList<FollowDTO> searchFollow(String mem_id) {
		ArrayList<FollowDTO> list = (ArrayList) sqlsession.selectList("memberns.fol_list", mem_id);  
		return list;
	}
	public ArrayList<FollowDTO> searchFollower(String target_id) {
		ArrayList<FollowDTO> list = (ArrayList) sqlsession.selectList("memberns.follower", target_id);  
		return list;
	}
	public int followCheck(FollowDTO dto){
		int result = 0;
		FollowDTO list = sqlsession.selectOne("memberns.followCheck",dto);
		if(list != null){
			result = 1;
		}
		return result;
	}
	public void follow(FollowDTO dto){
		sqlsession.update("memberns.follow_new", dto);
	}
	public void unfollow(FollowDTO dto){
		sqlsession.delete("memberns.unfollow", dto);
	}
}
