package com.multi.multigg.model.dto;

//CREATE TABLE COMMENTRECOMMEND(
//		MEMBERNICKNAME VARCHAR(100) PRIMARY KEY,
//		COMMENTNO INT NOT NULL,
//		RECOMMEND INT NOT NULL
//		
//	);

public class RecommendDto {
	private int memberno;
	private int commentno;
	private int recommend;
	
	
	public RecommendDto() {
		super();
	}


	public RecommendDto(int memberno, int commentno, int recommend) {
		super();
		this.memberno = memberno;
		this.commentno = commentno;
		this.recommend = recommend;
	}


	public int getMemberno() {
		return memberno;
	}


	public void setMemberno(int memberno) {
		this.memberno = memberno;
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

	
}
