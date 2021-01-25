package DAO;

import DTO.LikeyDTO;

public interface LikeyDAO {
	public LikeyDTO likecheck(LikeyDTO dto) throws Exception;
	public void delete_like(LikeyDTO dto) throws Exception;
	public void insert_like(LikeyDTO dto) throws Exception;
	
}
