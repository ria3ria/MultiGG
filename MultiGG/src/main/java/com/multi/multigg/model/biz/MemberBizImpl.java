package com.multi.multigg.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.multigg.model.dao.MemberDao;
import com.multi.multigg.model.dto.MemberDto;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	@Override
	public int insert(MemberDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int idCheck(String memberemail) {
		return dao.idCheck(memberemail);
	}
	@Override
	public String pwCheck(String memberemail){
		return dao.pwCheck(memberemail);
	}
	
	@Override
	public void pwUpdate(String memberemail, String hashedPw){
		dao.pwUpdate(memberemail, hashedPw);
	}
}
