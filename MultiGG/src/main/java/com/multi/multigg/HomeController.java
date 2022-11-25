package com.multi.multigg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.multigg.model.biz.BoardBiz;
import com.multi.multigg.model.biz.CommentBiz;
import com.multi.multigg.model.dto.BoardDto;

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
		
		BoardDto dto = biz.selectOne(boardno);
		//뎃글 모여주기 기능
		model.addAttribute("commentList",commentBiz.selectList(dto.getBoardno()));
				
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
}
