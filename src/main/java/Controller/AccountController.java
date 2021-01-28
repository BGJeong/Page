package Controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.codehaus.jackson.JsonNode;
import org.imgscalr.Scalr;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;

import DTO.Board;
import DTO.FollowDTO;
import DTO.LikeyDTO;
import DTO.memberDTO;
import service.FollowServiceImpl;
import service.LikeyService;
import service.LikeyServiceImple;
import service.MemberServiceImpl;
import service.PageService;

@Controller
public class AccountController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);
	@Autowired
	private MemberServiceImpl service;
	@Autowired
	private PageService page_service;
	@Autowired
	private FollowServiceImpl follow_service;
	@Autowired
	private LikeyServiceImple likey_service;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	private KakaoController kakaologin;

	@RequestMapping(value = "retire.do")
	public String retire() {
		return "account/retire";
	}

	@RequestMapping(value = "retireAction.do", method = RequestMethod.POST)
	public String retireAction(String passwd, HttpSession session) {
		String userid = (String) session.getAttribute("id");
		memberDTO dto = service.findpwd(userid);
		if (!dto.getPasswd().equals(passwd)) {
			return "account/deleteResult";
		} else {
			String filePath = session.getServletContext().getRealPath("upload");
			String file_name = dto.getProfile_img();
			logger.info(filePath);

			if (file_name != null) {
				File userFile = new File(filePath);
				File[] f = userFile.listFiles();
				for (int i = 0; i < f.length; i++) {
					if (f[i].getName().equals(file_name)) {
						f[i].delete();
					}
				}
			}
			service.deleteMember(userid);
			session.invalidate();
		}
		return "redirect:login.do";
	}

	@SuppressWarnings("null")
	@RequestMapping(value = "/edit_ok.do", method = RequestMethod.POST)
	public String edit_ok(@RequestParam(value = "profile", required = false) MultipartFile mf, memberDTO dto,
			HttpServletRequest request, HttpSession session, Model model) throws Exception {
		String filename = "";
		if (mf.isEmpty()) {
			filename = "default.png";
		} else {
			filename = mf.getOriginalFilename();
		}
		int index = filename.lastIndexOf(".");
		String fileName = filename.substring(0, index);
		String fileExt = filename.substring(index + 1);

		int size = (int) mf.getSize();

		String path = request.getRealPath("upload");
		int result = 0;
		String file[] = new String[2];

		if (filename != "") {

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();

			if (size > 1000000) {
				result = 1;
				model.addAttribute("result", result);

				return "account/uploadResult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")
					&& !file[1].equals("JPG") && !file[1].equals("jpeg")) {

				result = 2;
				model.addAttribute("result", result);

				return "account/uploadResult";
			}

		}
		UUID uuid = UUID.randomUUID();
		String newFileName = "";
		if (filename.equals("default.png")) {
			newFileName = filename;
		} else {
			newFileName = uuid.toString() + "_" + filename;
			File newfile = new File(path + "/" + newFileName);

			if (size > 0) {
				mf.transferTo(newfile);
			}
			String filePath = path + "\\" + newFileName;
			logger.info("filePath : " + filePath);

			BufferedImage Img = ImageIO.read(new File(filePath));
			int dw = 200, dh = 200;
			int ow = Img.getWidth();
			int oh = Img.getHeight();
			int nw = ow;
			int nh = (ow * dh) / dw;
			if (nh > oh) {
				nw = (oh * dw) / dh;
				nh = oh;
			}
			BufferedImage croped = Scalr.crop(Img, (ow - nw) / 2, (oh - nh) / 2, nw, nh);
			BufferedImage reImg = Scalr.resize(croped, dw, dh);

			String thumbName = path + "\\" + uuid.toString() + "_THUMB_" + fileName + "." + fileExt;
			logger.info("thumbName : " + thumbName);
			File thumbFile = new File(thumbName);
			ImageIO.write(reImg, fileExt, thumbFile);
		}

		String id = (String) session.getAttribute("id");
		memberDTO mem = service.findpwd(id);
		if (size > 0) {
			dto.setProfile_img(uuid.toString() + "_THUMB_" + fileName + "." + fileExt);
		} else {
			dto.setProfile_img(mem.getProfile_img());
		}
		dto.setUserid(id);
		System.out.println(dto.getBirth());
		service.edit(dto);
		session.setAttribute("pimg", dto.getProfile_img());
		return "redirect:edit.do";
	}

	@RequestMapping(value = "/editPass.do")
	public String editPass() {
		return "account/editPass";
	}

	@RequestMapping(value = "/editPass_ok.do")
	public String editPass_ok(@RequestParam("passwd_now") String passwd_now, @RequestParam("passwd") String passwd,
			@RequestParam("passwd_cf") String passwd_cf, HttpSession session, Model model) throws Exception {
		int result = 0;
		System.out.println(passwd_now);
		System.out.println(passwd);
		System.out.println(passwd_cf);
		String id = (String) session.getAttribute("id");
		memberDTO dto = service.findpwd(id);
		if (passwd_now.equals(dto.getPasswd())) {
			if (passwd.equals(passwd_cf)) {
				dto.setPasswd(passwd);
				service.editPass(dto);
				model.addAttribute("result", result);
				return "account/editPassResult";
			} else {
				result = 1;
				model.addAttribute("result", result);
				return "account/editPassResult";
			}
		} else {
			result = 2;
			model.addAttribute("result", result);
			return "account/editPassResult";
		}
	}

	@RequestMapping(value = "/edit.do")
	public String edit(HttpSession session, Model model) {
		String userid = "";
		if (session.getAttribute("id") != null) {
			userid = (String) session.getAttribute("id");
		} else {
			logger.warn("session媛� null Exception. �빐�떦�쐞移� �솗�씤");
		}
		memberDTO dto = service.findpwd(userid);
		model.addAttribute("dto", dto);
		return "account/edit";
	}

	@RequestMapping(value = "/home.do")
	public String home() {
		return "board/board_home";
	}

	@RequestMapping("idfindform.do")
	public String idfindform() {
		return "account/idfindform";
	}

	@RequestMapping("pwfindform.do")
	public String pwfindform() {
		return "account/pwfindform";
	}

	@RequestMapping(value = "/find_pwd.do")
	public String find_pwd() {
		return "account/find_pwd";
	}

	@RequestMapping(value = "find_pwd_ok.do")
	public String find_pwd_ok(@RequestParam("id") String id, Model model) {
		memberDTO dto = service.findpwd(id);
		if (dto == null) {
			model.addAttribute("pass", -1);
			return "account/find_pwd_result";
		} else {
			model.addAttribute("id", dto.getUserid());
			model.addAttribute("pass", dto.getPasswd());
			return "account/find_pwd";
		}
	}

	@RequestMapping(value = "/login.do")
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		String kakaoUrl = kakaologin.getAuthorizationUrl(session);

		model.addAttribute("kakao_url", kakaoUrl);
		model.addAttribute("url", naverAuthUrl);
		
		return "account/login";
	}

	@RequestMapping(value = "/mypage.do")
	public String mypage(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		String id = "";
		if (session.getAttribute("id") != null) {
			id = (String) session.getAttribute("id");
		} else {
			id = "";
			response.sendRedirect("login.do");
		}
		ArrayList<Board> list = new ArrayList<Board>();
		ArrayList<Board> board = page_service.getBoardList(id);

		memberDTO dto = service.findpwd(id);
		model.addAttribute("dto", dto);
		model.addAttribute("board", board);
		return "account/mypage";
	}

	@RequestMapping("mypop.do")
	public String mypop(int no, Model model) {
		Board dto = page_service.board_conf(no);
		model.addAttribute("pop", dto);
		return "account/mypop";
	}

	@RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		session.invalidate();
		return "redirect:index.jsp";
	}

	@RequestMapping(value = "/kakaocallback.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, memberDTO member, Model model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		System.out.println("kakao콜백");
//		ModelAndView mav = new ModelAndView();
		// 결과값을 node에 담아줌
		JsonNode node = kakaologin.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = kakaologin.getKakaoUserInfo(accessToken);
		String kemail = null;
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		System.out.println(kakao_account.asText());
		kemail = kakao_account.path("email").asText();
		System.out.println("이메일" + kemail);
		memberDTO dto = service.userInfoEmail(kemail);
		if (dto != null) {
			String userid = dto.getUserid();
			// id로 세션발행
			session.setAttribute("id", userid);
			session.setAttribute("pimg", dto.getProfile_img());
			session.setAttribute("dto", dto);
			// my페이지로
			return "account/home";

			// 신규유저 join으로 보냄 id,nickname
		} else if (dto == null) {
			member.setEmail(kemail);
			model.addAttribute("member", member);

			return "account/join";
		}
		return "";
	}// end kakaoLogin()

	@RequestMapping(value = "callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			memberDTO member) throws IOException, ParseException {
//		OAuth2AccessToken oauthToken;
//		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//		apiResult = naverLoginBO.getUserProfile(oauthToken);
//		logger.info(apiResult);
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse(apiResult);
//		JSONObject jsonObj = (JSONObject) obj;
//		JSONObject response_obj = (JSONObject) jsonObj.get("response");
//		String nickname = (String) response_obj.get("name");
//		String email = (String) response_obj.get("eamil");
//		System.out.println(nickname);
//		System.out.println(email);
//		session.setAttribute("id", nickname);
//		session.setAttribute("email", email);
//		model.addAttribute("result", apiResult);
		System.out.println("callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터

		// 2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		// Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		// response의 nickname값 파싱
		System.out.println(response_obj.toString());
		// 이메일 추출
		String email = (String) response_obj.get("email");
		String nickname = (String) response_obj.get("nickname");
		// 가입된user인지 email로 확인
		memberDTO dto = service.userInfoEmail(email);
		// 가입유저다?
		if (dto != null) {
			String userid = dto.getUserid();
			// id로 세션발행
			session.setAttribute("id", userid);
			session.setAttribute("pimg", dto.getProfile_img());
			session.setAttribute("dto", dto);
			// my페이지로
			return "account/home";

			// 신규유저 join으로 보냄 id,nickname
		} else if (dto == null) {
			member.setEmail(email);
			member.setNickname(nickname);
			model.addAttribute("member", member);

			return "account/join";
		}
		return "";

	}

	@RequestMapping(value = "/header.do")
	public String header() {
		return "account/header";
	}

	@RequestMapping(value = "/loginAction.do", method = RequestMethod.POST)
	public String loginAction(String userid, String passwd, Model model, HttpSession session) throws Exception {
		int result = 0;
		memberDTO dto = service.login(userid);
		if (dto == null) {
			result = 1;
			model.addAttribute("result", result);
			return "account/loginResult";
		} else {
			if (dto.getPasswd().equals(passwd)) {
				session.setAttribute("id", userid);
				session.setAttribute("pimg", dto.getProfile_img());
				session.setAttribute("dto", dto);

				return "redirect:/board_home.do";
			} else {
				result = 1;
				model.addAttribute("result", result);
				return "account/loginResult";
			}
		}
	}

	@RequestMapping(value = "/search.do")
	public String search() {
		return "account/search";
	}

	@RequestMapping(value = "/join.do")
	public String join() {
		return "account/join";
	}

	@RequestMapping(value = "/joinAction.do", method = RequestMethod.POST)
	public String joinAction(@ModelAttribute("dto") memberDTO dto, Model model) throws Exception {

		service.insert(dto);

//		String keys = "";
//		int key;
//		for (int i = 0; i < 4; i++) {
//			key = (int) (Math.random() * 9 + 1);
//			keys += key;
//		}
//		System.out.println(keys);
//		try {
//			HtmlEmail mail = new HtmlEmail();
//			mail.setDebug(true);
//			mail.setCharset("utf-8");
//			mail.setSSL(true);
//			mail.setHostName("smtp.naver.com");
//			mail.setSmtpPort(587);
//
//			mail.setAuthentication("aw1530@naver.com", "page1530"); // 관리자 이메일 비밀번호
//			mail.setTLS(true);
//			mail.addTo(dto.getEmail(), "utf-8");// 받는사람 메일
//			mail.setFrom("aw1530@naver.com", "운영자", "utf-8"); // 보내는 메일
//			mail.setSubject("인증번호 발송");
//			mail.setHtmlMsg("<p align = 'center'>이메일 인증번호</p><br>" + "<p align = 'center'>인증번호 :</p>" + keys);
//			mail.send();
//
//		} catch (Exception e) {
//			System.out.println(e);
//		}
//		model.addAttribute("keys", keys);
		return "account/login";
	}

	// 메일 인증완료
	@RequestMapping(value = "ecupdate.do")
	@ResponseBody
	public String ecupdate(String email) {
		service.ecupdate(email);
		System.out.println("email" + email);
		return "account/injengResult";
	}

	@RequestMapping(value = "idcheck.do")
	public String idcheck(@RequestParam("username") String id, Model model) {
		int result = service.idcheck(id);
		model.addAttribute("result", result);
		return "account/idcheckresult";
	}

	@RequestMapping(value = "searchAction.do")
	@ResponseBody
	public ArrayList<memberDTO> searchAction(@RequestParam("search") String search, Model model) {
		ArrayList<memberDTO> list = service.searchAction(search);

		return list;
	}

	@RequestMapping(value = "follow.do")
	@ResponseBody
	public int follow(@RequestParam("fid") String target_id, Model model, HttpSession session) throws Exception {
		int result = 0;
		String mem_id = (String) session.getAttribute("id");
		Map<String, String> map = new HashMap<String, String>();
		map.put("target_id", target_id);
		map.put("mem_id", mem_id);
		result = service.follow(map);
		logger.info("result : " + result);
		return result;
	}

	@RequestMapping(value = "userView.do", method = RequestMethod.GET)
	public String userView(@RequestParam("uid") String uid, Model model, HttpSession session) throws Exception {
		logger.info(uid);
		memberDTO dto = service.findpwd(uid);
		ArrayList<Board> board = page_service.getBoardList(uid);
		ArrayList<LikeyDTO> arr_like = new ArrayList<LikeyDTO>();
		ArrayList<Integer> arr_int = new ArrayList<Integer>();
		for(int i = 0; i < board.size(); i ++) {
			LikeyDTO likeyDTO = new LikeyDTO();
			likeyDTO.setLike_bbsid(board.get(i).getNo());
			likeyDTO.setLike_userid((String)session.getAttribute("id"));
			arr_like.add(likey_service.likecheck(likeyDTO));
			arr_int.add(likey_service.totalLike(likeyDTO).size());
		}
		for(int i : arr_int) {
			System.out.println(i);
		}
		model.addAttribute("arr_int", arr_int);
		model.addAttribute("arr_like", arr_like);
		model.addAttribute("board", board);
		model.addAttribute("userdto", dto);
		return "account/userView";
	}

	@RequestMapping("idfindcheck.do")
	public String idfindcheck(memberDTO member, Model model, RedirectAttributes rda) {
		int result = 0;
		String email = member.getEmail();
		memberDTO dbmember = service.userInfoEmail(email);
		if (dbmember != null) {
			System.out.println(dbmember.getEmail());
			System.out.println(dbmember.getUserid());
			result = 1;

			rda.addFlashAttribute("result", result);

			System.out.println("id : " + dbmember.getUserid());

			// id瑜� 硫붿씪濡� 蹂대궡湲�
			return "redirect:sendemail.do?mailtype=idfind&useremail=" + email;

		} else {
			model.addAttribute("result", result);

		}

		return "account/emailfindresult";
	}

	// pw 李얘린 �쉶�썝 �솗�씤
	@RequestMapping("pwfind.do")
	public String pwfindcheck(memberDTO member, Model model, RedirectAttributes rda) {
		int result = 0;
		String userid = member.getUserid();
		memberDTO dbmember = service.userInfoId(userid);

		if (dbmember != null) {
			String mailtype = "pwfind";
			if (member.getEmail().equals(dbmember.getEmail()) && member.getUserid().equals(dbmember.getUserid())) {

				// 臾댁옉�쐞 �븫�샇 �깮�꽦
				StringBuffer newpasswd = new StringBuffer();
				Random rnd = new Random();
				for (int i = 0; i < 20; i++) {
					int rIndex = rnd.nextInt(3);
					switch (rIndex) {
					case 0:
						// a-z
						newpasswd.append((char) ((int) (rnd.nextInt(26)) + 97));
						break;
					case 1:
						// A-Z
						newpasswd.append((char) ((int) (rnd.nextInt(26)) + 65));
						break;
					case 2:
						// 0-9
						newpasswd.append((rnd.nextInt(10)));
						break;
					}
				}

				// Stringbuffer - String �삎蹂��솚
				String passwd = newpasswd.toString();

				dbmember.setPasswd(passwd);

				// �븫�샇 �뾽�뜲�씠�듃
				result = service.rdpasswd(dbmember);

				System.out.println("pw�닔�젙" + result);

				// rda.addFlashAttribute("member1", dbmember);
				rda.addFlashAttribute("result", result);

				// id瑜� 硫붿씪濡� 蹂대궡湲�
				return "redirect:sendemail.do?mailtype=pwfind&useremail=" + dbmember.getEmail();

			} else {
				System.out.println("�븘�씠�뵒 �삉�뒗 �씠硫붿씪 ��由�");
				result = 2;
			}

		} else {
			model.addAttribute("result", result);

		}

		return "account/pwfindresult";
	}

	@RequestMapping("sendemail.do")
	public String send(Model model, String mailtype, String useremail) {
		// Mail Server �꽕�젙
		memberDTO member = service.userInfoEmail(useremail);
		;
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "c_pak86"; // id
		String hostSMTPpwd = "Project1230"; // 鍮꾨�踰덊샇

		String fromEmail = "c_pak86@naver.com"; // 蹂대궡�뒗 硫붿씪紐�
		String fromName = "page 관리자";

		String subject = null;
		String msg = null;

		if (mailtype.equals("idfind")) {
			subject = "Page id 안내메일입니다.";
			msg = "<p align = 'center'>" + member.getNickname() + "님의 page id는 아래와 같습니다.</p><br>"
					+ "<div align='center'> id : " + member.getUserid() + "</div>";
		}

		if (mailtype.equals("pwfind")) {
			subject = "Page의 임시 비밀번호가 발급되었습니다..";
			msg = "<p align = 'center'>" + member.getNickname() + "님의 page 임시비밀번호는 아래와 같습니다.</p><br>"
					+ "<div align='center'> 임시 비밀번호 : " + member.getPasswd() + "</div>"
					+ "<p align = 'center'>반드시 로그인 후 변경해주세요.</p><br>";
		}

		// 諛쏅뒗 �궗�엺 E-Mail 二쇱냼
		String mail = member.getEmail();

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println(e);
		}

		if (mailtype.equals("idfind")) {

			return "account/emailfindresult";

		} else if (mailtype.equals("pwfind")) {

			return "account/pwfindresult";

		}
		return "";

	}

	@RequestMapping(value = "/email_check.do", method = RequestMethod.POST)
	@ResponseBody
	public int email_check(@RequestParam("email") String mail, Model model) throws Exception {
		int result = service.checkMail(mail);
		logger.info(mail);
		// System.out.println("email : "+ mail);

		model.addAttribute("result", result);

		return result;
	}
}
