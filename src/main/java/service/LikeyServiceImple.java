package service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.LikeyDAO;
import DTO.LikeyDTO;

@Service
public class LikeyServiceImple implements LikeyService{
	@Autowired
	private LikeyDAO dao;
	
	public LikeyDTO likecheck(LikeyDTO dto) throws Exception {
		return dao.likecheck(dto);
	}
	public void delete_like(LikeyDTO dto) throws Exception {
		dao.delete_like(dto);
	}
	public void insert_like(LikeyDTO dto) throws Exception {
		dao.insert_like(dto);
	}
	public ArrayList<LikeyDTO> totalLike(LikeyDTO dto) throws Exception {
		return dao.totalLike(dto);
	}
}
