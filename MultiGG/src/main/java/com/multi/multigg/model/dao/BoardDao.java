package com.multi.multigg.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.multi.multigg.model.dto.BoardDto;

public interface BoardDao {
	
	String NAMESPACE = "board.";
	
	public List<BoardDto> selectList(int page);
	public List<BoardDto> searchList(Map<String, Object> map);
	public List<BoardDto> kategorieList(Map<String, Object> map);
	public Date likeMember(Map<String, Object> map);
	public int insertLike(Map<String, Object> map);
	public int likeCnt(int boardno);
	public int contentCnt(int memberno);
	public int memberCommentCnt(int memberno);
	public int boardCommentCnt(int boardno);
	public BoardDto selectOne(int myno);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int myno);
	public String[] saveFile(String path, MultipartFile[] uploadFile);
}
