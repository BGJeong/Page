package service;

import java.util.ArrayList;
import java.util.Map;

import DTO.memberDTO;

public interface MemberService {

	public void insert(memberDTO dto) throws Exception;
	public int idcheck(String id) throws Exception;
	public memberDTO login(String userid) throws Exception;
	public memberDTO findpwd(String id) throws Exception;
	public void edit(memberDTO dto) throws Exception;
	public void deleteMember(String userid) throws Exception;
	public ArrayList<memberDTO> searchAction(String userid) throws Exception;
	public int follow(Map<String, String> map) throws Exception;
	public memberDTO userInfo(String userid) throws Exception;
	public memberDTO userInfoEmail(String email) throws Exception;
	public memberDTO userInfoId(String userid) throws Exception;
	public int rdpasswd(memberDTO member) throws Exception;
	public int checkMail(String mail) throws Exception;
	public void editPass(memberDTO dto) throws Exception;
	public void ecupdate(String email) throws Exception;	// 메일 인증부분
}
