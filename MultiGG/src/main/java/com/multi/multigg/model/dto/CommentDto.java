package com.multi.multigg.model.dto;

import java.util.Date;

//CREATE TABLE COMMENT(
//		COMMENTNO INT AUTO_INCREMENT PRIMARY KEY,
//		BOARDNO INT,
//		COMMENTWRITER VARCHAR(1000) NOT NULL,
//		COMMENTTITLE VARCHAR(10000) NOT NULL,
//		COMMENTGOOD INT NOT NULL,
//		COMMENTBAD INT NOT NULL,
//		COMMENTDATE DATE NOT NULL
//	);


public class CommentDto {
	private int commentno;
	private int boardno;
	private String commentwriter;
	private String commenttitle;
	private int commentgood;
	private int commentbad;
	private Date commentdate;
	
	
	public CommentDto() {
		super();
	}


	public CommentDto(int commentno, int boardno, String commentwriter, String commenttitle, int commentgood,
			int commentbad, Date commentdate) {
		super();
		this.commentno = commentno;
		this.boardno = boardno;
		this.commentwriter = commentwriter;
		this.commenttitle = commenttitle;
		this.commentgood = commentgood;
		this.commentbad = commentbad;
		this.commentdate = commentdate;
	}


	public int getCommentno() {
		return commentno;
	}


	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}


	public int getBoardno() {
		return boardno;
	}


	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}


	public String getCommentwriter() {
		return commentwriter;
	}


	public void setCommentwriter(String commentwriter) {
		this.commentwriter = commentwriter;
	}


	public String getCommenttitle() {
		return commenttitle;
	}


	public void setCommenttitle(String commenttitle) {
		this.commenttitle = commenttitle;
	}


	public int getCommentgood() {
		return commentgood;
	}


	public void setCommentgood(int commentgood) {
		this.commentgood = commentgood;
	}


	public int getCommentbad() {
		return commentbad;
	}


	public void setCommentbad(int commentbad) {
		this.commentbad = commentbad;
	}


	public Date getCommentdate() {
		return commentdate;
	}


	public void setCommentdate(Date commentdate) {
		this.commentdate = commentdate;
	}
	
	
	
}
