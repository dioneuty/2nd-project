package com.hb.staff.model;

import java.util.Date;

public class EduDto {
	private int enum2, etotalday, unum, stnum;
	private String ename, esub1, esub2, esub3, uname;
	private Date startdate,enddate;
	/*private String startdate,enddate;*/
	public int getEnum2() {
		return enum2;
	}
	public void setEnum2(int enum2) {
		this.enum2 = enum2;
	}
	public int getEtotalday() {
		return etotalday;
	}
	public void setEtotalday(int etotalday) {
		this.etotalday = etotalday;
	}
	public int getUnum() {
		return unum;
	}
	public void setUnum(int unum) {
		this.unum = unum;
	}
	public int getStnum() {
		return stnum;
	}
	public void setStnum(int stnum) {
		this.stnum = stnum;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEsub1() {
		return esub1;
	}
	public void setEsub1(String esub1) {
		this.esub1 = esub1;
	}
	public String getEsub2() {
		return esub2;
	}
	public void setEsub2(String esub2) {
		this.esub2 = esub2;
	}
	public String getEsub3() {
		return esub3;
	}
	public void setEsub3(String esub3) {
		this.esub3 = esub3;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "EduDto [enum2=" + enum2 + ", etotalday=" + etotalday
				+ ", unum=" + unum + ", stnum=" + stnum + ", ename=" + ename
				+ ", esub1=" + esub1 + ", esub2=" + esub2 + ", esub3=" + esub3
				+ ", uname=" + uname + ", startdate=" + startdate
				+ ", enddate=" + enddate + "]";
	}
	
	
	
	
}
