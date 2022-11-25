package com.multi.multigg.model.dto;

public class LolPnDto {
	private String title;
	private String headcontent;
	private String content;
	
	
	public LolPnDto() {
		super();
	}

	public LolPnDto(String title, String headcontent, String content) {
		super();
		this.title = title;
		this.headcontent = headcontent;
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHeadcontent() {
		return headcontent;
	}

	public void setHeadcontent(String headcontent) {
		this.headcontent = headcontent;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
