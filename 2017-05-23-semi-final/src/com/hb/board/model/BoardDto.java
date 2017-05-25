package com.hb.board.model;

import java.util.Date;

public class BoardDto {
	private String uids,uname,wpw,title;
	private int idx, utype;
	private Date regdate;
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUids() {
		return uids;
	}
	public void setUids(String uids) {
		this.uids = uids;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getWpw() {
		return wpw;
	}
	public void setWpw(String wpw) {
		this.wpw = wpw;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getUtype() {
		return utype;
	}
	public void setUtype(int utype) {
		this.utype = utype;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "BoardDto [uids=" + uids + ", uname=" + uname + ", wpw=" + wpw + ", title=" + title + ", utype=" + utype + ", regdate=" + regdate + "]";
	}
	
	
}
