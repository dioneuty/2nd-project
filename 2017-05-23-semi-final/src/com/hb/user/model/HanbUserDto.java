package com.hb.user.model;

public class HanbUserDto {
	int unum;
	String uids;
	String upw;
	String uname;
	String uemail;
	String uphone;
	int utype;
	
	public HanbUserDto(){}

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	public String getUids() {
		return uids;
	}

	public void setUids(String uids) {
		this.uids = uids;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public int getUtype() {
		return utype;
	}

	public void setUtype(int utype) {
		this.utype = utype;
	}

	@Override
	public String toString() {
		return "HanbUserDto [unum=" + unum + ", uids=" + uids + ", upw=" + upw + ", uname=" + uname + ", uemail="
				+ uemail + ", uphone=" + uphone + ", utype=" + utype + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((uemail == null) ? 0 : uemail.hashCode());
		result = prime * result + ((uids == null) ? 0 : uids.hashCode());
		result = prime * result + ((uname == null) ? 0 : uname.hashCode());
		result = prime * result + unum;
		result = prime * result + ((uphone == null) ? 0 : uphone.hashCode());
		result = prime * result + ((upw == null) ? 0 : upw.hashCode());
		result = prime * result + utype;
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
		HanbUserDto other = (HanbUserDto) obj;
		if (uemail == null) {
			if (other.uemail != null)
				return false;
		} else if (!uemail.equals(other.uemail))
			return false;
		if (uids == null) {
			if (other.uids != null)
				return false;
		} else if (!uids.equals(other.uids))
			return false;
		if (uname == null) {
			if (other.uname != null)
				return false;
		} else if (!uname.equals(other.uname))
			return false;
		if (unum != other.unum)
			return false;
		if (uphone == null) {
			if (other.uphone != null)
				return false;
		} else if (!uphone.equals(other.uphone))
			return false;
		if (upw == null) {
			if (other.upw != null)
				return false;
		} else if (!upw.equals(other.upw))
			return false;
		if (utype != other.utype)
			return false;
		return true;
	}
	
	
}
