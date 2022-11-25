package com.multi.multigg.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.multigg.model.dao.CommentDao;
import com.multi.multigg.model.dto.CommentDto;

@Service
public class CommentBizImpl implements CommentBiz{
	
	@Autowired
	private CommentDao dao;

	@Override
	public List<CommentDto> selectList(int boardno) {
		return dao.selectList(boardno);
	}

	@Override
	public int insert(CommentDto commentDto) {
		return dao.insert(commentDto);
	}

	@Override
	public int update(CommentDto commentDto) {
		
		return dao.update(commentDto);
	}

	@Override
	public int delete(int myno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
