package com.hb.user.model;

import java.util.Date;

public class UserAttendDto {
	private int unum, state, tcheck;
	private String st_time, ed_time;
	private Date atdate;
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getTcheck() {
		return tcheck;
	}
	public void setTcheck(int tcheck) {
		this.tcheck = tcheck;
	}
	public String getSt_time() {
		return st_time;
	}
	public void setSt_time(String st_time) {
		this.st_time = st_time;
	}
	public String getEd_time() {
		return ed_time;
	}
	public void setEd_time(String ed_time) {
		this.ed_time = ed_time;
	}
	public Date getAtdate() {
		return atdate;
	}
	public void setAtdate(Date atdate) {
		this.atdate = atdate;
	}	 
	
}
