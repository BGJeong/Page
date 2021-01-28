package Controller;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	@RequestMapping(value="/clickLikeUser.do")
	@ResponseBody
	public HashMap<String, String> clickLikeUser(@RequestParam("board_no") String board_no,
						@RequestParam("userid") String userid) throws Exception{
		String uid = userid;
		LikeyDTO user_info = new LikeyDTO();
		user_info.setLike_bbsid(Integer.parseInt(board_no));
		user_info.setLike_userid(uid);
		LikeyDTO likey_dto = likey_service.likecheck(user_info);
		if(likey_dto != null){
			likey_service.delete_like(user_info);
			LikeyDTO dto = new LikeyDTO();
			dto.setLike_bbsid(Integer.parseInt(board_no));
			ArrayList<LikeyDTO> arr = likey_service.totalLike(dto);
			String a = Integer.toString(arr.size());
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("result", "0");
			map.put("totalLike", a);
			return map;
		} else {
			likey_service.insert_like(user_info);
			LikeyDTO dto = new LikeyDTO();
			dto.setLike_bbsid(Integer.parseInt(board_no));
			ArrayList<LikeyDTO> arr = likey_service.totalLike(dto);
			String a = Integer.toString(arr.size());
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("result", "1");
			map.put("totalLike", a);
			return map;
		}
	}
	
	@RequestMapping(value="/clickLike.do")
	@ResponseBody
	public HashMap<String, String> clickLike(@RequestParam("board_no") String board_no, HttpSession session) throws Exception{
		String uid = (String)session.getAttribute("id");
		LikeyDTO user_info = new LikeyDTO();
		user_info.setLike_bbsid(Integer.parseInt(board_no));
		user_info.setLike_userid(uid);
		LikeyDTO likey_dto = likey_service.likecheck(user_info);
		if(likey_dto != null){
			likey_service.delete_like(user_info);
			LikeyDTO dto = new LikeyDTO();
			dto.setLike_bbsid(Integer.parseInt(board_no));
			ArrayList<LikeyDTO> arr = likey_service.totalLike(dto);
			String a = Integer.toString(arr.size());
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("result", "0");
			map.put("totalLike", a);
			return map;
		} else {
			likey_service.insert_like(user_info);
			LikeyDTO dto = new LikeyDTO();
			dto.setLike_bbsid(Integer.parseInt(board_no));
			ArrayList<LikeyDTO> arr = likey_service.totalLike(dto);
			String a = Integer.toString(arr.size());
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("result", "1");
			map.put("totalLike", a);
			return map;
		}
	}
	@RequestMapping(value="/totalLikeChange.do")
	@ResponseBody
	public String totalLikeChange(@RequestParam("board_no") String board_no, HttpSession session) throws Exception {
		LikeyDTO dto = new LikeyDTO();
		dto.setLike_bbsid(Integer.parseInt(board_no));
		ArrayList<LikeyDTO> arr = likey_service.totalLike(dto);
		String a = Integer.toString(arr.size());
		return a;
	}
}
