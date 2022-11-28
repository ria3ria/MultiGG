package com.multi.multigg.model.dto;

//CREATE TABLE COMMENTRECOMMEND(
//		MEMBERNICKNAME VARCHAR(100) PRIMARY KEY,
//		COMMENTNO INT NOT NULL,
//		RECOMMEND INT NOT NULL
//		
//	);

public class RecommendDto {
	private String membernickname;
	private int commentno;
	private int recommend;
	
	public RecommendDto() {
		super();
	}

	public RecommendDto(String membernickname, int commentno, int recommend) {
		super();
		this.membernickname = membernickname;
		this.commentno = commentno;
		this.recommend = recommend;
	}

	public String getMembernickname() {
		return membernickname;
	}

	public void setMemvernickname(String membernickname) {
		this.membernickname = membernickname;
	}

	public int getCommentno() {
		return commentno;
	}

	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	@Override
	public String toString() {
		return "RecommendDto [membernickname=" + membernickname + ", commentno=" + commentno + ", recommend="
				+ recommend + "]";
	}
	

	

}
