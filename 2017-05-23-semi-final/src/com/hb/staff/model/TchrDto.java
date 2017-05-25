package com.hb.staff.model;

public class TchrDto {
	private Integer unum, enum2;
	private String uname, ename;
	public Integer getUnum() {
		return unum;
	}
	public void setUnum(Integer unum) {
		this.unum = unum;
	}
	public Integer getEnum2() {
		return enum2;
	}
	public void setEnum2(Integer enum2) {
		this.enum2 = enum2;
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
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ename == null) ? 0 : ename.hashCode());
		result = prime * result + ((enum2 == null) ? 0 : enum2.hashCode());
		result = prime * result + ((uname == null) ? 0 : uname.hashCode());
		result = prime * result + ((unum == null) ? 0 : unum.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TchrDto other = (TchrDto) obj;
		if (ename == null) {
			if (other.ename != null)
				return false;
		} else if (!ename.equals(other.ename))
			return false;
		if (enum2 == null) {
			if (other.enum2 != null)
				return false;
		} else if (!enum2.equals(other.enum2))
			return false;
		if (uname == null) {
			if (other.uname != null)
				return false;
		} else if (!uname.equals(other.uname))
			return false;
		if (unum == null) {
			if (other.unum != null)
				return false;
		} else if (!unum.equals(other.unum))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "TchrDto [unum=" + unum + ", enum2=" + enum2 + ", uname="
				+ uname + ", ename=" + ename + "]";
	}
	
	
}
