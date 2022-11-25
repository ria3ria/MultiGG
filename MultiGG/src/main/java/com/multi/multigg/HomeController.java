package com.multi.multigg;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.multigg.model.biz.BoardBiz;
import com.multi.multigg.model.dto.BoardDto;
import com.multi.multigg.model.dto.LolPnDto;

@Controller
public class HomeController {
	
	@Autowired
	private BoardBiz biz;
	
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/lol.do")
	public String lol(Model model) {
		model.addAttribute("list", biz.selectList());
		return "lol";
	}
	
	@RequestMapping("/boardsearch.do")
	public String boardsearch(Model model, String keyword) {
		model.addAttribute("list", biz.searchList(keyword));
		return "lol";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/boardwriteform.do")
	public String boardWriteForm() {
		return "boardwriteform";
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
			return "redirect:lol.do";
		}
		else {
			return "redirect:boardwriteform.do";
		}
	}
	
	@RequestMapping("/boardupdate.do")
	public String boardUpdate(BoardDto dto) {
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
		return "boarddetail";
	}
	
	@RequestMapping("/boarddelete.do")
	public String boardDelete(int boardno) {
		int res = biz.delete(boardno);
		
		if(res>0) {
			return "redirect:lol.do";
		}
		else {
			return "redirect:boarddetail.do?boardno="+boardno;
		}
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
		
		
		
		LolPnDto dto = new LolPnDto();
		dto.setTitle(ele.select("h4").text());
		dto.setHeadcontent(ele.select("span").text());
		dto.setContent(ele.select("li").text());
		
		
		model.addAttribute("dto", dto);
		
		return "lolinfo";
	}
}
