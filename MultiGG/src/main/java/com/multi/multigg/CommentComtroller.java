package com.multi.multigg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.multigg.model.biz.CommentBiz;
import com.multi.multigg.model.biz.ReccomendBiz;
import com.multi.multigg.model.dto.CommentDto;
import com.multi.multigg.model.dto.RecommendDto;


@Controller
public class CommentComtroller {
	
	@Autowired
	private CommentBiz commentBiz;
	@Autowired
	private ReccomendBiz recommendBiz;
	
	
	@PostMapping("commentinsert.do")
	public String commentInsert(CommentDto commentDto) {
		try {
			commentBiz.insert(commentDto);
		} catch (Exception e) {
			System.out.println("[error] : comment insert");
			e.printStackTrace();
		}
		System.out.println(commentDto);
		
		return "redirect:boarddetail.do?boardno="+commentDto.getBoardno();
			
	}
	
	@RequestMapping("commentupdate.do")
	public String commentUpdate(CommentDto commentDto ) {
		
		commentBiz.update(commentDto);
		
		return "redirect:boarddetail.do?boardno="+commentDto.getBoardno();
	}
	
	@RequestMapping("commentdelete.do")
	public String commentdelete(int commentno, int boardno) {
	
		
		commentBiz.delete(commentno);
		
		
		return "redirect:boarddetail.do?boardno="+boardno;
	}
	
	@RequestMapping("commentrecommend.do")
	public String commentrecommend(Model model,@ModelAttribute RecommendDto recommendDto, int boardno) {
		int[] recommend = new int[2];
		recommend = recommendBiz.commentRecommend(recommendDto);
		System.out.println(recommendDto.getMembernickname());
		System.out.println(recommendDto);
		
		model.addAttribute("good",recommend[0]);
		model.addAttribute("bad",recommend[1]);
		return "redirect:boarddetail.do?boardno="+boardno;
	}

}
