package com.multi.multigg;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.multi.multigg.model.biz.MemberBiz;
import com.multi.multigg.model.dto.MemberDto;




@Controller
public class MemberController {
private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberBiz biz;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@RequestMapping("/loginform.do") // loginform.do 가 들어오면 얘가 처리  
	public String loginForm() {
		logger.info("LOGIN FORM");
		return "login";
		
	}
	
	@RequestMapping(value="/ajaxlogin.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Boolean> ajaxLogin(HttpSession session, 
			@RequestBody MemberDto dto){
		logger.info("LOGIN");
		
		//@RequestBody: request객체로 넘어오는 데이터를 java object로 변환
		//@ResponseBody: java object를 response객체에 binding
		System.out.println(dto.getMemberemail());
		System.out.println(dto.getMemberpw());
		
		MemberDto res = biz.login(dto);
		// db에서 넘어온 걸 res에 저장
		boolean check = false;
		//dto의 pw와 res의 pw가 같은지 확인
		if(res != null) {
			if(passwordEncoder.matches(dto.getMemberpw(), res.getMemberpw())) {
				session.setAttribute("login", res); // login 이라는 이름으로 res
				check = true;		
			}// 넘어온 아이디의 pw가 일치하는지
			
		}
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("check", check);
		
		return map; // response에 바인딩이 된채로 ajax success:msg가 받는다
	}
	@RequestMapping("/registerform.do")
	public String memberInsertForm() {
		logger.info("REGISTER FORM");
	
		return"register";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) throws IOException {
		session.invalidate();	
		return "login";
	}
	
	@PostMapping("/idChk.do")
	@ResponseBody
	public int idCheck(@RequestParam("memberemail") String memberemail) {
		int res = 0;
		res= biz.idCheck(memberemail);
		
		return res;
		
		
		
		
	}
	
	
	
	//요청을 처리하는 메소드 작성("/register.do")
	// 이 때 넘어오는 데이터 받아서 dto에 저장 후 출력문으로 id,pw,name 확인
	
	
	@RequestMapping("/register.do")
	public String memberInsert(MemberDto dto, HttpServletResponse response) throws IOException {
		// 화면에서 넘어오는 password를 암호화 해서 dto에 저장
			dto.setMemberpw(passwordEncoder.encode(dto.getMemberpw()));
		int res = biz.insert(dto);

		if(res>0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.println("<script>alert('"+dto.getMembernickname()+ "님 가입을 축하합니다!'); location.href='loginform.do'; self.close();</script>");
			out.flush();
			return"redirect:loginform.do";
		}else {
			return"redirect:registerform.do";
		}
	}
	
	@RequestMapping("/mypage.do")
	public String myPage() {
		
		return "mypage";
		
	}
	@RequestMapping("/mypageupdate.do")
	public String memberUpdate() {
		
		return "mypageUpdate";
		
	}

//	@RequestMapping(value="/pwCheck" , method=RequestMethod.POST)
//	@ResponseBody
//	public int pwCheck(MemberDto dto) throws Exception{
//		String memberpw = biz.pwCheck(dto.getMemberemail());
//		if( dto == null || !BCrypt.checkpw(dto.getMemberpw(), memberpw)) {
//			return 0;
//		}
//		return 1;
//	}
//	
//	@RequestMapping(value="/pwUpdate" , method=RequestMethod.POST)
//	public String pwUpdate(String memberemail,String memberPw1,RedirectAttributes rttr,HttpSession session)throws Exception{
//		String hashedPw = BCrypt.hashpw(memberPw1, BCrypt.gensalt());
//		biz.pwUpdate(memberemail, hashedPw);
//		session.invalidate();
//		rttr.addFlashAttribute("msg", "정보 수정이 완료되었습니다. 다시 로그인해주세요.");
//		
//		return "login";
//	}
//	
	
}
