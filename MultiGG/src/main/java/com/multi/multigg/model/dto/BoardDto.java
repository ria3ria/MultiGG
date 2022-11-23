package com.multi.multigg.model.dto;

import java.util.Date;

public class BoardDto {
	private String boardkategorie;
	private int boardno;
	private String boardname;
	private String boardtitle;
	private String boardcontent;
	private Date boarddate;
	public BoardDto() {
		super();
	}
	public BoardDto(String boardkategorie, int boardno, String boardname, String boardtitle, String boardcontent,
			Date boarddate) {
		super();
		this.boardkategorie = boardkategorie;
		this.boardno = boardno;
		this.boardname = boardname;
		this.boardtitle = boardtitle;
		this.boardcontent = boardcontent;
		this.boarddate = boarddate;
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
	@Override
	public String toString() {
		return "BoardDto [boardkategorie=" + boardkategorie + ", boardno=" + boardno + ", boardname=" + boardname
				+ ", boardtitle=" + boardtitle + ", boardcontent=" + boardcontent + ", boarddate=" + boarddate + "]";
	}
}
