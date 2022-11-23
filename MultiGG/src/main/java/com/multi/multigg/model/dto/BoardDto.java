package com.multi.multigg.model.dto;

import java.util.Date;

public class BoardDto {
	private String boardkategorie;
	private int boardno;
	private String boardname;
	private String boardtitle;
	private String boardcontent;
	private Date boarddate;
	private int boardview;
	private int boardlike;
	public BoardDto() {
		super();
	}
	public BoardDto(String boardkategorie, int boardno, String boardname, String boardtitle, String boardcontent,
			Date boarddate, int boardview, int boardlike) {
		super();
		this.boardkategorie = boardkategorie;
		this.boardno = boardno;
		this.boardname = boardname;
		this.boardtitle = boardtitle;
		this.boardcontent = boardcontent;
		this.boarddate = boarddate;
		this.boardview = boardview;
		this.boardlike = boardlike;
	}
	public String getBoardkategorie() {
		return boardkategorie;
	}
	public int getBoardno() {
		return boardno;
	}
	public String getBoardname() {
		return boardname;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public Date getBoarddate() {
		return boarddate;
	}
	public int getBoardview() {
		return boardview;
	}
	public int getBoardlike() {
		return boardlike;
	}
	public void setBoardkategorie(String boardkategorie) {
		this.boardkategorie = boardkategorie;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}
	public void setBoardview(int boardview) {
		this.boardview = boardview;
	}
	public void setBoardlike(int boardlike) {
		this.boardlike = boardlike;
	}
	@Override
	public String toString() {
		return "BoardDto [boardkategorie=" + boardkategorie + ", boardno=" + boardno + ", boardname=" + boardname
				+ ", boardtitle=" + boardtitle + ", boardcontent=" + boardcontent + ", boarddate=" + boarddate
				+ ", boardview=" + boardview + ", boardlike=" + boardlike + "]";
	}
}
