package DAO;

import java.util.ArrayList;

import DTO.LikeyDTO;

public interface LikeyDAO {
	public LikeyDTO likecheck(LikeyDTO dto) throws Exception;
	public void delete_like(LikeyDTO dto) throws Exception;
	public void insert_like(LikeyDTO dto) throws Exception;
	public ArrayList<LikeyDTO> totalLike(LikeyDTO dto) throws Exception;
}
