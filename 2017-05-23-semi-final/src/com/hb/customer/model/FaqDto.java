package com.hb.customer.model;

import java.util.Date;

public class FaqDto {
	 // 질문번호 
    private Integer fnum;

    // 질문제목 
    private String fsub;

    // 질문내용 
    private String fqcont;

    // 답변내용 
    private String facont;

    // 작성자 
    private String uname;

    // 작성일 
    private Date fdate;
    
    private int ftype;

    public Integer getFnum() {
        return fnum;
    }

    public void setFnum(Integer fnum) {
        this.fnum = fnum;
    }

    public String getFsub() {
        return fsub;
    }

    public void setFsub(String fsub) {
        this.fsub = fsub;
    }

    public String getFqcont() {
        return fqcont;
    }

    public void setFqcont(String fqcont) {
        this.fqcont = fqcont;
    }

    public String getFacont() {
        return facont;
    }

    public void setFacont(String facont) {
        this.facont = facont;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Date getFdate() {
        return fdate;
    }

    public void setFdate(Date fdate) {
        this.fdate = fdate;
    }

    public int getFtype() {
		return ftype;
	}

	public void setFtype(int ftype) {
		this.ftype = ftype;
	}

	// Faq 모델 복사
    public void CopyData(FaqDto param)
    {
        this.fnum = param.getFnum();
        this.fsub = param.getFsub();
        this.fqcont = param.getFqcont();
        this.facont = param.getFacont();
        this.uname = param.getUname();
        this.fdate = param.getFdate();
    }
}
