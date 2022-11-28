package com.multi.multigg.model.dto;

import java.util.Date;

public class MemberDto {
	private int memberno;
	private String memberemail;
	private String memberpw;
	private String membernickname;
	private String membername;
	private String memberlevel;
	private Date memberdate;
	public MemberDto() {
		super();
	}
	

	public MemberDto(int memberno, String memberemail, String memberpw, String membernickname, String membername,
			String memberlevel, Date memberdate) {
		super();
		this.memberno = memberno;
		this.memberemail = memberemail;
		this.memberpw = memberpw;
		this.membernickname = membernickname;
		this.membername = membername;
		this.memberlevel = memberlevel;
		this.memberdate = memberdate;
	}

	public int getMemberno() {
		return memberno;
	}
	public String getMemberemail() {
		return memberemail;
	}
	public String getMemberpw() {
		return memberpw;
	}
	public String getMembername() {
		return membername;
	}
	public String getMemberlevel() {
		return memberlevel;
	}
	public Date getMemberdate() {
		return memberdate;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public void setMemberemail(String memberemail) {
		this.memberemail = memberemail;
	}
	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public void setMemberlevel(String memberlevel) {
		this.memberlevel = memberlevel;
	}
	public void setMemberdate(Date memberdate) {
		this.memberdate = memberdate;
	}

	public String getMembernickname() {
		return membernickname;
	}

	public void setMembernickname(String membernickname) {
		this.membernickname = membernickname;
	}
	
}
