package com.hb.job.model;

public class JobStateDto {
	  // 현황게시물번호 
    private Integer jnum;

    // 유저이름 
    private String uname;

    // 교육과정명 
    private String jsub;

    // 취업업체명 
    private String jcompany;

    // 취업분야 
    private String jfield;

    public Integer getJnum() {
        return jnum;
    }

    public void setJnum(Integer jnum) {
        this.jnum = jnum;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getJsub() {
        return jsub;
    }

    public void setJsub(String jsub) {
        this.jsub = jsub;
    }

    public String getJcompany() {
        return jcompany;
    }

    public void setJcompany(String jcompany) {
        this.jcompany = jcompany;
    }

    public String getJfield() {
        return jfield;
    }

    public void setJfield(String jfield) {
        this.jfield = jfield;
    }

    // JobState 모델 복사
    public void CopyData(JobStateDto param)
    {
        this.jnum = param.getJnum();
        this.uname = param.getUname();
        this.jsub = param.getJsub();
        this.jcompany = param.getJcompany();
        this.jfield = param.getJfield();
    }
}
