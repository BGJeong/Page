package DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import DTO.memberDTO;

@Repository
public class memberDAOImple implements memberDAO {
	@Autowired
	private SqlSession sqlsession;

	public void insert(memberDTO dto) {
		sqlsession.insert("memberns.member_insert", dto);
	}

	public int idcheck(String id) {
		int result = 0;
		memberDTO dto = sqlsession.selectOne("memberns.member_findpwd", id);
		if (dto != null) {
			result = 1;
		}
		return result;
	}

	public memberDTO login(String userid) {
		return sqlsession.selectOne("memberns.member_idcheck", userid);
	}

	public memberDTO findpwd(String id) {
		return sqlsession.selectOne("memberns.member_findpwd", id);
	}

	public void edit(memberDTO dto) {
		sqlsession.update("memberns.member_edit", dto);
	}

	public void deleteMember(String userid) {
		sqlsession.delete("memberns.member_delete", userid);
	}

	public ArrayList<memberDTO> searchAction(String userid) {
		ArrayList<memberDTO> list = (ArrayList) sqlsession.selectList("memberns.memberSearch", userid);
		return list;
	}

	public int follow(Map<String, String> map) {
		return sqlsession.insert("memberns.follow", map);
	}

	public memberDTO userInfo(String userid) {
		return sqlsession.selectOne("memberns.selectuser", userid);
	}

	public memberDTO userInfoEmail(String userInfoEmail) {
		return sqlsession.selectOne("memberns.selectuseremail", userInfoEmail);
	}

	public memberDTO userInfoId(String userid) {
		return sqlsession.selectOne("memberns.selectuserid", userid);
	}

	public int rdpasswd(memberDTO member) {
		return sqlsession.update("memberns.rdpasswd", member);
	}

	public int checkMail(String mail) throws Exception {

		int result = 0; // �궗�슜媛��뒫 �씠硫붿씪

		memberDTO mb = (memberDTO) sqlsession.selectOne("mail_check", mail);

		if (mb != null)
			result = 1;

		return result;
	}
	public void editPass(memberDTO dto) throws Exception {
		sqlsession.update("memberns.editPass", dto);
	}
	
	public void ecupdate(String email) {
		sqlsession.update("memberns.member_ecupdate",email); //이메일 인증업데이트
	}
}
