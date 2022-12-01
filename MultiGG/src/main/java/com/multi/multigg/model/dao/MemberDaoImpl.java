package com.multi.multigg.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.multigg.model.dto.MemberDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public MemberDto login(MemberDto dto) {
		MemberDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"login", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] login");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insert(MemberDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : member insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int idCheck(String memberemail) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"idCheck", memberemail);	
		} catch (Exception e) {
			System.out.println("[error] : member idCheck");
			e.printStackTrace();
		}
		
		return res;
	}
	@Override
	public int nickCheck(String membernickname) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE+"nickCheck", membernickname);	
		} catch (Exception e) {
			System.out.println("[error] : member nickCheck");
			e.printStackTrace();
		}
		
		return res;
	}
	@Override
	public String pwCheck(String memberemail){
		return sqlSession.selectOne(NAMESPACE+"pwCheck", memberemail);
	}
	
	@Override
	public void modifyPw(MemberDto dto){
		
	  sqlSession.update(NAMESPACE+"modifyPw",dto);
		
	}

	@Override
	public MemberDto getMemberemail(String memberemail) {
		
		return sqlSession.selectOne(NAMESPACE+"getMemberemail", memberemail);
	}

	@Override
	public void infoUpdate(MemberDto dto) {
		sqlSession.update(NAMESPACE+"infoUpdate",dto);
		
	}
}
