package service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.FollowDAO;
import DTO.FollowDTO;

@Service
public class FollowServiceImpl implements FollowService{
	
	@Autowired
	private FollowDAO dao;
	
	public ArrayList<FollowDTO> searchFollow(String mem_id) throws Exception {
		return dao.searchFollow(mem_id);
	}
	public ArrayList<FollowDTO> searchFollower(String target_id) throws Exception {
		return dao.searchFollower(target_id);
	}

	public int followCheck(FollowDTO dto) throws Exception{
		return dao.followCheck(dto);
	}
	public void follow(FollowDTO dto) throws Exception{
		dao.follow(dto);
	}
	public void unfollow(FollowDTO dto) throws Exception{
		dao.unfollow(dto);
	}
}
