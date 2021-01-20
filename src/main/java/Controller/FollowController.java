package Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import DTO.FollowDTO;
import DTO.memberDTO;
import service.FollowServiceImpl;
import service.MemberServiceImpl;

@Controller
public class FollowController {

	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	
	@Autowired
	private FollowServiceImpl service;
	@Autowired
	private MemberServiceImpl mem_service;
	
	@RequestMapping(value="searchFollow.do")
	@ResponseBody
	public ArrayList<FollowDTO> searchFollow(@RequestParam("fol_list") String mem_id) throws Exception{
		logger.info(mem_id);
		ArrayList<FollowDTO> fol_dto = service.searchFollow(mem_id);
		return fol_dto;
	}
	
	@RequestMapping(value="searchFollower.do")
	@ResponseBody
	public ArrayList<FollowDTO> searchFollower(@RequestParam("follower") String target_id) throws Exception{
		logger.info(target_id);
		ArrayList<FollowDTO> fol_dto = service.searchFollower(target_id);
		return fol_dto;
	}
	

	@RequestMapping(value="following.do", method=RequestMethod.GET)
	public String follwing(@RequestParam("userid") String mem_id, Model model) throws Exception {
		ArrayList<FollowDTO> following_dto = service.searchFollow(mem_id);
		ArrayList<memberDTO> list = new ArrayList<memberDTO>();
		for(int i =0; i < following_dto.size(); i++){
			list.add(mem_service.findpwd(following_dto.get(i).getTarget_id()));
		}
		model.addAttribute("mem_info", list);
		model.addAttribute("following_dto", following_dto);
		return "account/following";
	}
	

	@RequestMapping(value="follower.do", method=RequestMethod.GET)
	public String follower(@RequestParam("userid") String target_id, Model model) throws Exception{
		ArrayList<FollowDTO> follower_dto = service.searchFollower(target_id);
		ArrayList<memberDTO> list = new ArrayList<memberDTO>();
		for(int i =0; i< follower_dto.size(); i++){
			list.add(mem_service.findpwd(follower_dto.get(i).getMem_id()));
		}
		model.addAttribute("fol_mem_info",list);
		model.addAttribute("follower_dto", follower_dto);
		return "account/follower";
	}

	@RequestMapping(value="userFollow.do")
	@ResponseBody
	public int userFollow(@RequestParam("userFollow") String follow_id, HttpSession session) throws Exception{
		int result = 0;
		FollowDTO dto = new FollowDTO();
		String sid = (String)session.getAttribute("id");
		dto.setMem_id(sid);
		dto.setTarget_id(follow_id);
		result = service.followCheck(dto);
		if(result == 1){
			return result;
		} else {
			result = 2;
		}
		return result;
	}
	
	@RequestMapping(value="unfollow.do")
	@ResponseBody
	public void unfol(@RequestParam("unfol") String target_id, HttpSession session) throws Exception{
		FollowDTO dto = new FollowDTO();
		String sid = (String)session.getAttribute("id");
		dto.setMem_id(sid);
		dto.setTarget_id(target_id);
		service.unfollow(dto);
	}
	@RequestMapping(value="newFollow.do")
	@ResponseBody
	public void newFollow(@RequestParam("newfol") String target_id, HttpSession session) throws Exception {
		FollowDTO dto = new FollowDTO();
		String sid = (String) session.getAttribute("id");
		dto.setMem_id(sid);
		dto.setTarget_id(target_id);
		service.follow(dto);
	}
	
}
