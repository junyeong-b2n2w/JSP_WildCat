package com.wild.dto;

import java.util.Date;

public class ReplyVO {

	private int rno;
	private int bno;
	private int prno;
	private String replyer;
	private String replyText;
	private Date regDate;
	private Date updateDate;

	public ReplyVO() {
	}

	public ReplyVO(int rno, int bno, int prno,String replyer, String replyText, Date regDate, Date updateDate) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.prno= prno;
		this.replyer = replyer;
		this.replyText = replyText;
		this.regDate = regDate;
		this.updateDate = updateDate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getPrno() {
		return prno;
	}

	public void setPrno(int prno) {
		this.prno = prno;
	}

	@Override
	public String toString() {
		return "ReplyVO [rno=" + rno + ", bno=" + bno + ", prno=" + prno + ", replyer=" + replyer + ", replyText="
				+ replyText + ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}

	public String getReplyer() {
		return replyer;
	}

	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}

	public String getReplyText() {
		return replyText;
	}

	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	
}
