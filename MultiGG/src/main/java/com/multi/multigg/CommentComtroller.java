package com.multi.multigg;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.multigg.model.biz.CommentBiz;
import com.multi.multigg.model.dto.CommentDto;


@Controller
public class CommentComtroller {
	
	@Autowired
	private CommentBiz commentBiz;
	
	
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
		int res=0;
		
		res = commentBiz.delete(commentno);
		
		
		return "redirect:boarddetail.do?boardno="+boardno;
	}

}
