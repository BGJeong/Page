package Controller;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import DTO.LikeyDTO;
import service.LikeyServiceImple;

@Controller
public class LikeyController {

	@Autowired
	private LikeyServiceImple likey_service;
	
	@RequestMapping(value="/clickLike.do")
	@ResponseBody
	public String clickLike(@RequestParam("board_no") String board_no, HttpSession session) throws Exception{
		String uid = (String)session.getAttribute("id");
		LikeyDTO user_info = new LikeyDTO();
		user_info.setLike_bbsid(Integer.parseInt(board_no));
		user_info.setLike_userid(uid);
		LikeyDTO likey_dto = likey_service.likecheck(user_info);
		if(likey_dto != null){
			likey_service.delete_like(user_info);
			return "0";
		} else {
			likey_service.insert_like(user_info);
			return "1";
		}
	}
}
