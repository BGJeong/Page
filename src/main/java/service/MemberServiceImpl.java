package service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.memberDAOImple;
import DTO.memberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private memberDAOImple dao;
	public void insert(memberDTO dto) {
		dao.insert(dto);
	}
	public int idcheck(String id) {
		return dao.idcheck(id);
	}
	public memberDTO login(String userid){
		return dao.login(userid);
	}
	public memberDTO findpwd(String id) {
		return dao.findpwd(id);
	}
	public void edit(memberDTO dto) {
		dao.edit(dto);
	}
	public void deleteMember(String userid) {
		dao.deleteMember(userid);
	}
	public ArrayList<memberDTO> searchAction(String userid){
		return dao.searchAction(userid);
	}
	public int follow(Map<String, String> map) throws Exception{
		return dao.follow(map);
	}
	public memberDTO userInfo(String userid) {
		return dao.userInfo(userid);
	}
	
	public memberDTO userInfoEmail(String email) {
		return dao.userInfoEmail(email);
	}
	public memberDTO userInfoId(String userid) {
		return dao.userInfoId(userid);
	}
	public int rdpasswd(memberDTO member) {
		return dao.rdpasswd(member);
	}
	public int checkMail(String mail) throws Exception{
		return dao.checkMail(mail);
	}
	public void editPass(memberDTO dto) throws Exception {
		dao.editPass(dto);
	}
	public void ecupdate(String email) { //이메일 인증업데이트
		dao.ecupdate(email);
	}
}
