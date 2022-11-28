package com.multi.multigg.model.dto;

import org.jsoup.select.Elements;

public class LolPnDto {
	private String title;
	private String headcontent;
	private String content;
	private Elements image;
	
	public LolPnDto() {
		super();
	}

	public LolPnDto(String title, String headcontent, String content, Elements image) {
		super();
		this.title = title;
		this.headcontent = headcontent;
		this.content = content;
		this.image = image;
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

	public Elements getImage() {
		return image;
	}

	public void setImage(Elements elements) {
		this.image = elements;
	}

	
	
}
