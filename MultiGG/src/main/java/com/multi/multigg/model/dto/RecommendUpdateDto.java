package com.multi.multigg.model.dto;

public class RecommendUpdateDto {
	private int commentno;
	private int count;
	
	public RecommendUpdateDto() {
		super();
	}

	public RecommendUpdateDto(int commentno, int count) {
		super();
		this.commentno = commentno;
		this.count = count;
	}

	public int getCommentno() {
		return commentno;
	}

	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
	

}
