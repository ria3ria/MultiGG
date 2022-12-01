package com.multi.multigg.model.dao;

import com.multi.multigg.model.dto.MemberDto;

public interface MemberDao {
	String NAMESPACE = "member.";
	
	public MemberDto login(MemberDto dto);
	public int insert(MemberDto dto);
	public int idCheck(String memberemail);
	public int nickCheck(String membernickname);
	
	public String pwCheck(String memberemail);
	
	public void modifyPw(MemberDto dto);
	
	public MemberDto getMemberemail(String memberemail);
	
	public void infoUpdate(MemberDto dto);
}
