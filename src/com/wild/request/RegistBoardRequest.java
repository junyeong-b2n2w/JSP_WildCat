package com.wild.request;

import java.util.Date;

import com.wild.dto.BoardVO;

public class RegistBoardRequest {
	
	private String title;
	private String content;
	private String writer;
	private String gb;
	private String category;
	
	public RegistBoardRequest() {}
	public RegistBoardRequest(String title, String content, String writer, String gb,String category) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.gb=gb;
		this.category=category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getGb() {
		return gb;
	}
	public void setGb(String gb) {
		this.gb = gb;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "RegistBoardRequest [title=" + title + ", content=" + content + ", writer=" + writer + "]";
	}
	
	public BoardVO toBoardVO() {
		BoardVO board = new BoardVO();
		board.setTitle(this.title);
		board.setContent(this.content);
		board.setWriter(this.writer);
		board.setGb(this.gb);
		board.setCategory(this.category);
		board.setViewcnt(0);
		board.setRegDate(new Date());
		board.setUpdateDate(new Date());
		
		return board;
	}
	
}
