package com.multi.multigg.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.multigg.model.dto.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CommentDto> selectList(int boardno) {
		List<CommentDto> list = new ArrayList<CommentDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList",boardno);
		} catch (Exception e) {
			System.out.println("[error] : comment select list");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insert(CommentDto commentDto) {
		int res = 0; 
		try {
			res = sqlSession.insert(NAMESPACE+"insert",commentDto);
			System.out.println(commentDto.getBoardno());
		} catch (Exception e) {
			System.out.println("[error] : comment insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(CommentDto commentDto) {
		int res = 0; 
		try {
			res = sqlSession.update(NAMESPACE+"update",commentDto);
		} catch (Exception e) {
			System.out.println("[error] : comment update");
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public int delete(int commentno) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete",commentno);
		} catch (Exception e) {
			System.out.println("[error] : comment delete");
			e.printStackTrace();
		}
		
		
		return 0;
	}

}
