package com.multi.multigg.model.dao;

import java.util.List;

import com.multi.multigg.model.dto.CommentDto;

public interface CommentDao {
	
	String NAMESPACE = "comment.";
	
	public List<CommentDto> selectList(int boardno);
	public int insert(CommentDto dto);
	public int update(CommentDto dto);
	public int delete(int myno);

}
