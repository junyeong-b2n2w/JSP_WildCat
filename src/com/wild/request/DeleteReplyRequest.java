package com.wild.request;

public class DeleteReplyRequest {

	private int bno;
	private int rno;
	private int page;
	
	public int getPage() {
		return page;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public void setPage(int page) {
		this.page = page;
	}
}
