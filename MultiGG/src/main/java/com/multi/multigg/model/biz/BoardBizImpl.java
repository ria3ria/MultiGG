package com.multi.multigg.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.multigg.model.dao.BoardDao;
import com.multi.multigg.model.dto.BoardDto;

@Service
public class BoardBizImpl implements BoardBiz {
	
	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardDto> selectList() {
		return dao.selectList();
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
	public List<BoardDto> searchList(String keyword) {
		return dao.searchList(keyword);
	}

}
