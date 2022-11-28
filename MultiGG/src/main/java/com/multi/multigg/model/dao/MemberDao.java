package com.multi.multigg.model.dao;

import com.multi.multigg.model.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
	public int idCheck(String memberemail);
	public String pwCheck(String memberemail);
	public void pwUpdate(String memberemail, String hashedPw);
}
