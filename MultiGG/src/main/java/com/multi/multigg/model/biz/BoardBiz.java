package com.multi.multigg.model.biz;

import java.util.List;

import com.multi.multigg.model.dto.BoardDto;

public interface BoardBiz {
	public List<BoardDto> selectList();
	public BoardDto selectOne(int myno);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int myno);
}
