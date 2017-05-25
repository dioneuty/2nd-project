package com.hb.student.model;

public class StuDto {
	int unum, enum1;
	String uids, uname, ename;
	String fir_sub, sec_sub, thr_sub;
	String esub1, esub2, esub3;
	int s_total, s_append, s_early, s_absent;
	int s_empoly,s_cmpt,s_sucemp;
	
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

	public int getUnum() {
		return unum;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public int getEnum1() {
		return enum1;
	}

	public void setEnum1(int enum1) {
		this.enum1 = enum1;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getFir_sub() {
		return fir_sub;
	}

	public void setFir_sub(String fir_sub) {
		this.fir_sub = fir_sub;
	}

	public String getSec_sub() {
		return sec_sub;
	}

	public void setSec_sub(String sec_sub) {
		this.sec_sub = sec_sub;
	}

	public String getThr_sub() {
		return thr_sub;
	}

	public void setThr_sub(String thr_sub) {
		this.thr_sub = thr_sub;
	}

	public int getS_total() {
		return s_total;
	}

	public void setS_total(int s_total) {
		this.s_total = s_total;
	}

	public int getS_append() {
		return s_append;
	}

	public void setS_append(int s_append) {
		this.s_append = s_append;
	}

	public int getS_early() {
		return s_early;
	}

	public void setS_early(int s_early) {
		this.s_early = s_early;
	}

	public int getS_absent() {
		return s_absent;
	}

	public void setS_absent(int s_absent) {
		this.s_absent = s_absent;
	}

	public int getS_empoly() {
		return s_empoly;
	}

	public void setS_empoly(int s_empoly) {
		this.s_empoly = s_empoly;
	}

	public int getS_cmpt() {
		return s_cmpt;
	}

	public void setS_cmpt(int s_cmpt) {
		this.s_cmpt = s_cmpt;
	}

	public int getS_sucemp() {
		return s_sucemp;
	}

	public void setS_sucemp(int s_sucemp) {
		this.s_sucemp = s_sucemp;
	}

	@Override
	public String toString() {
		return "StuDto [unum=" + unum + ", enum1=" + enum1 + ", uids=" + uids
				+ ", uname=" + uname + ", ename=" + ename + ", fir_sub="
				+ fir_sub + ", sec_sub=" + sec_sub + ", thr_sub=" + thr_sub
				+ ", esub1=" + esub1 + ", esub2=" + esub2 + ", esub3=" + esub3
				+ ", s_total=" + s_total + ", s_append=" + s_append
				+ ", s_early=" + s_early + ", s_absent=" + s_absent
				+ ", s_empoly=" + s_empoly + ", s_cmpt=" + s_cmpt
				+ ", s_sucemp=" + s_sucemp + "]";
	}

	
	
}
