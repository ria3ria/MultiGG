package com.multi.multigg.model.biz;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.multi.multigg.model.dto.BoardDto;

public interface BoardBiz {
	public List<BoardDto> selectList(int page);
	public List<BoardDto> searchList(String keyword);
	public BoardDto selectOne(int myno);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int myno);
	public String[] saveFile(String path, MultipartFile[] uploadFile);
}
