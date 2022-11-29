package com.multi.multigg;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.multi.multigg.model.biz.BoardBiz;
import com.multi.multigg.model.biz.CommentBiz;
import com.multi.multigg.model.dto.BoardDto;
import com.multi.multigg.model.dto.LolPnDto;
import com.multi.multigg.model.dto.MemberDto;

@Controller
public class HomeController {
	
	@Autowired
	private BoardBiz biz;
	@Autowired
	private CommentBiz commentBiz;
	
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/lol.do")
	public String lol(HttpSession session, Model model, int page, String keyword, String order, String boardkategorie) {
		if(keyword != null && !keyword.isBlank()) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyword", keyword);
			map.put("page", page);
			model.addAttribute("list", biz.searchList(map));
		}
		else if(order != null && !order.isBlank()) {
			if(order.equals("view")) {
				
			}
		}
		else if(boardkategorie != null && !boardkategorie.isBlank()) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("boardkategorie", boardkategorie);
			map.put("page", page);
			model.addAttribute("list", biz.kategorieList(map));
		}
		else {
			model.addAttribute("list", biz.selectList(page));
		}
		if(session.getAttribute("login") != null) {
			MemberDto login = (MemberDto) session.getAttribute("login");
			model.addAttribute("contentCnt", biz.contentCnt(login.getMemberno()));
			model.addAttribute("commentCnt", biz.commentCnt(login.getMemberno()));
		}
		return "lol";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/boardupdateform.do")
	public String boardUpdateForm(Model model, int boardno) {
		model.addAttribute("dto", biz.selectOne(boardno));
		return "boardupdate";
	}
	
	@RequestMapping("/boardwrite.do")
	public String boardWrite(BoardDto dto) {
		int res = biz.insert(dto);
		
		if(res>0) {
			return "redirect:lol.do?page=0";
		}
		else {
			return "redirect:boardwriteform.do";
		}
	}
	
	@RequestMapping("/boardupdate.do")
	public String boardUpdate(BoardDto dto) {
		System.out.println("update: "+dto);
		int res = biz.update(dto);
		
		if(res>0) {
			return "redirect:boarddetail.do?boardno="+dto.getBoardno();
		}
		else {
			return "redirect:boardupdateform.do?boardno="+dto.getBoardno();
		}
	}
	
	@RequestMapping("/boarddetail.do")
	public String boardDetail(Model model, int boardno) {
		model.addAttribute("dto", biz.selectOne(boardno));
		
		BoardDto dto = biz.selectOne(boardno);
		//뎃글 모여주기 기능
		model.addAttribute("commentList",commentBiz.selectList(dto.getBoardno()));
		

				
		return "boarddetail";
	}
	
	@RequestMapping("/boarddelete.do")
	public String boardDelete(int boardno) {
		int res = biz.delete(boardno);
		
		if(res>0) {
			return "redirect:lol.do?page=0";
		}
		else {
			return "redirect:boarddetail.do?boardno="+boardno;
		}
	}
	
	@RequestMapping("/boardlike.do")
	public String boardLike(int boardno, int memberno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardno", boardno);
		map.put("memberno", memberno);
		if(biz.likeMember(map) == null) {
			biz.insertLike(map);
			BoardDto dto = biz.selectOne(boardno);
			dto.setBoardlike(biz.likeCnt(boardno));
			biz.update(dto);
		}
		return "redirect:boarddetail.do?boardno="+boardno;
	}
	
	@RequestMapping("/recode.do")
	public String recode() {
		return "recode";
	}
	
	@GetMapping("/lolinfo.do")
	public String lolinfo(Model model) {
		String URL = "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-22-notes/";
		Document doc = null;
		try {
			doc = Jsoup.connect(URL).get();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Elements ele = doc.select("#patch-notes-container > div:nth-child(10)");
		
		
		System.out.println(ele.select("h4").text());
		System.out.println(ele.select("span").text());
		System.out.println(ele.select("li").text());
		
		System.out.println(ele.select("a"));
		
		
		LolPnDto dto = new LolPnDto();
		dto.setTitle(ele.select("h4").text());
		dto.setHeadcontent(ele.select("span").text());
		dto.setContent(ele.select("li").text());
		dto.setImage(ele.select("a"));
		
		model.addAttribute("dto", dto);
		
		return "lolinfo";
	}
	
	@RequestMapping("/boardwriteform.do")
	public String boardWriteForm() {
		return "boardwriteform";
	}
	
	@ResponseBody
	@RequestMapping(value="/fileuploadajax.do", method=RequestMethod.POST)
	public String[] fileUploadAjax(HttpServletRequest request, Model model, MultipartFile[] uploadFile) {
		return biz.saveFile(request.getSession().getServletContext().getRealPath("/")+"img", uploadFile);
    }
}
