package com.multi.multigg.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.multi.multigg.model.dao.BoardDao;
import com.multi.multigg.model.dto.BoardDto;

@Service
public class BoardBizImpl implements BoardBiz {
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardDto> selectList(int page) {
		return dao.selectList(page);
	}

	@Override
	public BoardDto selectOne(int boardno) {
		return dao.selectOne(boardno);
	}

	@Override
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(BoardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int boardno) {
		return dao.delete(boardno);
	}

	@Override
	public List<BoardDto> searchList(Map<String, Object> map) {
		return dao.searchList(map);
	}

	@Override
	public String[] saveFile(String path, MultipartFile[] uploadFile) {
		return dao.saveFile(path, uploadFile);
	}

	@Override
	public List<BoardDto> orderByView(int page) {
		return dao.orderByView(page);
	}

	@Override
	public List<BoardDto> orderByLike(int page) {
		return dao.orderByLike(page);
	}
	

}
