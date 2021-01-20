package Controller;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import DTO.Board;
import service.PageService;

@Controller
public class PageController {
	
	@Autowired
	private PageService service;
	
	
	@RequestMapping("good.do")
	public String good() {
		
		return "redirct:board_home.do";
	}
	
	@RequestMapping("board_home.do")
	public String board_home(Model model) {
		System.out.println("home");
		
		List<Board> list = service.getBoardList();
		System.out.println("list: "+list);
		
		model.addAttribute("list", list);
		return "board/board_home";
	}
	
	//占쏙옙占쌜쇽옙 占쏙옙
	@RequestMapping("boardform.do")
	public String insertform() {
		System.out.println("boardform");
		return "board/boardform";
	}
	
	//占쏙옙占쌜쇽옙
	@RequestMapping("board_write.do")
	public String board_write( @RequestParam("upload_file") MultipartFile mf,
							  Board board,
							  HttpServletRequest request,
							  Model model) throws Exception {
		System.out.println("board_write");
//		System.out.println("board.file "+board.getUpload());
		
		//占쏙옙占쏙옙占쏙옙占쏙옙
		String filename = mf.getOriginalFilename();
		int size = (int)mf.getSize();
		String path = request.getRealPath("upload");	//getRealPath("")占쏙옙 webapp占쏙옙占쏙옙占쏙옙 占쏙옙占�
		int result = 0;
		int maxsize = 100000; //100kb
		
		System.out.println("mf: "+mf);
		System.out.println("filename: "+filename);
		System.out.println("size: "+size);
		System.out.println("path: "+path);
		
		String file[] = new String[2];
		
		//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
		if(filename !="" || size>0) {
			//image.jpg => image / jpg占쏙옙 占싻몌옙
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();	//占쏙옙占싹몌옙
			file[1] = st.nextToken();	//확占쏙옙占쏙옙
			
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
		
		result = service.insert(board);
		System.out.println("result: "+result);
		
		model.addAttribute("result", result);	
		return "board/board_write";
	}
	@RequestMapping(value="modal.do")
	public String modal() {
		return "board/modal";
	}
	//醫뗭븘�슂
//	@RequestMapping("good.do")
//	public String good(int no) {
//		return "bo"
//	}
	
}
