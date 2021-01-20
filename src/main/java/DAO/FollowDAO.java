package DAO;

import java.util.ArrayList;

import DTO.FollowDTO;

public interface FollowDAO {

	public ArrayList<FollowDTO> searchFollow(String mem_id) throws Exception;
	public ArrayList<FollowDTO> searchFollower(String target_id) throws Exception;
	public int followCheck(FollowDTO dto) throws Exception;
	public void follow(FollowDTO dto) throws Exception;
	public void unfollow(FollowDTO dto) throws Exception;
} 
