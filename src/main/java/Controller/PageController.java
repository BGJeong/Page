package Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import DTO.Board;
import DTO.FollowDTO;
import DTO.LikeyDTO;
import DTO.memberDTO;
import scala.collection.generic.BitOperations.Int;
import service.FollowServiceImpl;
import service.LikeyServiceImple;
import service.MemberServiceImpl;
import service.PageService;

@Controller
public class PageController {
	
	@Autowired
	private PageService page_service;
	@Autowired
	private FollowServiceImpl follow_service;
	@Autowired
	private MemberServiceImpl mem_service;
	@Autowired
	private LikeyServiceImple likey_service;
	
	@RequestMapping("good.do")
	public String good() {
		
		return "redirct:board_home.do";
	}
	
	@RequestMapping("board_home.do")
	public String board_home(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("home");
		String userid = (String)session.getAttribute("id");
		ArrayList<FollowDTO> fol_dto = follow_service.searchFollow(userid);
		ArrayList<Board> list = new ArrayList<Board>();
		ArrayList<memberDTO> mem_dto = new ArrayList<memberDTO>();
		ArrayList<LikeyDTO> likey = new ArrayList<LikeyDTO>();
		LikeyDTO likeDTO2 = new LikeyDTO();
		LikeyDTO likeDTO = new LikeyDTO();
		ArrayList<Integer> likeArrInt = new ArrayList<Integer>();
		if(fol_dto == null) {
			
		} else {
			for(int i = 0; i < fol_dto.size(); i++){
				list.addAll(page_service.getBoardList(fol_dto.get(i).getTarget_id())); 
			}
			for(int i = 0; i < list.size(); i++){
				mem_dto.add(mem_service.findpwd(list.get(i).getId()));
				likeDTO.setLike_bbsid(list.get(i).getNo());
				likeDTO.setLike_userid(userid);
				likey.add(likey_service.likecheck(likeDTO));
				likeDTO2.setLike_bbsid(list.get(i).getNo());
				likeArrInt.add(likey_service.totalLike(likeDTO2).size());

				}
			}
		int endrow = 3;
		int listcount = list.size();
		
		if(request.getParameter("endrow") != null) {
			endrow = Integer.parseInt(request.getParameter("endrow"));
		}
		model.addAttribute("likeArrInt",likeArrInt);
		model.addAttribute("mem_dto",mem_dto);
		model.addAttribute("list", list);
		model.addAttribute("likey", likey);
		model.addAttribute("endrow", endrow);
		model.addAttribute("listcount", listcount);
		
		return "board/board_home";
	}
	
	//�뜝�룞�삕�뜝�뙗�눦�삕 �뜝�룞�삕
	@RequestMapping("boardform.do")
	public String insertform() {
		System.out.println("boardform");
		return "board/boardform";
	}
	//updateform
	@RequestMapping(value="boardupdateform.do")
	public String boardupdateform(int no, Model model) {
		System.out.println("boardupdateform");
		Board board = page_service.getboard(no);
		model.addAttribute("board", board);
		return "board/boardupdateform";
	}
	//�뜝�룞�삕�뜝�뙗�눦�삕
	@RequestMapping("board_write.do")
	public String board_write( @RequestParam("upload_file") MultipartFile mf,
							  Board board,
							  HttpServletRequest request,
							  Model model,
							  HttpSession session) throws Exception {
		System.out.println("board_write");
//		System.out.println("board.file "+board.getUpload());
		
		//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
		String filename = mf.getOriginalFilename();
		int size = (int)mf.getSize();
		String path = request.getRealPath("upload");	//getRealPath("")�뜝�룞�삕 webapp�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝占�
		int result = 0;
		int maxsize = 100000; //100kb
		
		System.out.println("mf: "+mf);
		System.out.println("filename: "+filename);
		System.out.println("size: "+size);
		System.out.println("path: "+path);
		
		String file[] = new String[2];
		
		//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕
		if(filename !="" || size>0) {
			//image.jpg => image / jpg�뜝�룞�삕 �뜝�떩紐뚯삕
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();	//�뜝�룞�삕�뜝�떦紐뚯삕
			file[1] = st.nextToken();	//�솗�뜝�룞�삕�뜝�룞�삕
			
			//result = -1 : size�뜝�룞�삕 �뜝�떗諭꾩삕�겕�뜝�룞�삕
			//result = -2 : file �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�떛�븞�맂�뙋�삕.
			if(size > 100000) {
				result = -1;
			}else if(!file[1].equals("jpg") && 
					 !file[1].equals("gif") &&
					 !file[1].equals("png")) {
				result = -2;
			}
			
			//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�뙏�뙋�삕�뜝�떥琉꾩삕 �뜝�룞�삕�뜝�룞�삕
			mf.transferTo(new File(path+"/"+filename));	//throws Exception�뜝�룞�삕 �뜝�뙠�벝�삕�뜝占� �뜝�뙥怨ㅼ삕�뜝�룞�삕�뜝�뙇�뼲�삕�뜝�룞�삕�뜝占�
		}
		
		//board�뜝�룞�삕�뜝�룞�삕 file�뜝�떛紐뚯삕 �뜝�룞�삕�뜝�룞�삕
		board.setUpload(filename);
		String userid = (String)session.getAttribute("id");
		board.setId(userid);
		memberDTO dto = mem_service.findpwd(userid);
		board.setName(dto.getNickname());
		result = page_service.insert(board);
		System.out.println("result: "+result);
		
		model.addAttribute("result", result);	
		return "board/board_write";
	}
	
	@RequestMapping(value="boardupdate.do")
	public String boardupdate(@RequestParam("upload_file") MultipartFile mf,
							  HttpServletRequest request,
							  HttpSession session,
							  Board board, Model model) throws Exception {
		//
		String filename = mf.getOriginalFilename();
		int size = (int)mf.getSize();
		String path = request.getRealPath("upload");	//getRealPath("")는 webapp까지의 경로
		int result = 0;
		int maxsize = 100000; //100kb
		
		System.out.println("mf: "+mf);
		System.out.println("filename: "+filename);
		System.out.println("size: "+size);
		System.out.println("path: "+path);
		
		String file[] = new String[2];
		
		//filename이 존재할때
		if(filename !="" || size>0) {
			//image.jpg => image / jpg로 분리
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();	// image
			file[1] = st.nextToken();	// jpg
			
			//result = -1 : size占쏙옙 占십뱄옙크占쏙옙
			//result = -2 : file 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싱안된댐옙.
			if(size > 100000) {
				result = -1;
			}else if(!file[1].equals("jpg") && 
					 !file[1].equals("gif") &&
					 !file[1].equals("png")) {
				result = -2;
			}
			
			//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌔댐옙占싸뤄옙 占쏙옙占쏙옙
			mf.transferTo(new File(path+"/"+filename));	//throws Exception占쏙옙 占쌥듸옙占� 占쌩곤옙占쏙옙占쌍억옙占쏙옙占�
		}
		
		//board占쏙옙占쏙옙 file占싱몌옙 占쏙옙占쏙옙
		board.setUpload(filename);
		String userid = (String)session.getAttribute("id");
		board.setId(userid);
		memberDTO dto = mem_service.findpwd(userid);
		board.setName(dto.getNickname());
		result = page_service.insert(board);
		System.out.println("result: "+result);
		
		model.addAttribute("result", result);	
		return "board/board_update";
	}
	
	@RequestMapping("boarddelete.do")
	public String boardelete(int no, Model model, HttpSession session) throws Exception {
		System.out.println("boarddelete");
		
		int result = 0;
		Board board = page_service.getboard(no);
		String path = session.getServletContext().getRealPath("upload");
		String filename = board.getUpload();
		System.out.println("path:"+path);
		System.out.println("filename:"+filename);
		
		
		//image file delete
		if(filename != null) {
			File delFile = new File(path);
			File[] f = delFile.listFiles();
			
			for(int i=0; i<f.length; i++) {
				if(f[i].getName().equals(filename)) {
					f[i].delete();
				}
			}
		}
		
		result = page_service.delete(no);
		model.addAttribute("result", result);
		
		return "board/board_delete";
	}
	
	
	@RequestMapping(value="modal.do")
	public String modal() {
		return "board/modal";
	}
	//�넫�뿭釉섓옙�뒄
//	@RequestMapping("good.do")
//	public String good(int no) {
//		return "bo"
//	}
	
}
