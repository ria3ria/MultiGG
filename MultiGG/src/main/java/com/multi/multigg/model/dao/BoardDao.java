package com.multi.multigg.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.multi.multigg.model.dto.BoardDto;

public interface BoardDao {
	
	String NAMESPACE = "board.";
	
	public List<BoardDto> selectList(int page);
	public List<BoardDto> searchList(Map<String, Object> map);
	public BoardDto selectOne(int myno);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int myno);
	public String[] saveFile(String path, MultipartFile[] uploadFile);
}
