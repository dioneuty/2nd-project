package com.hb.job.model;

public class JobStateDto {
	  // ��Ȳ�Խù���ȣ 
    private Integer jnum;

    // �����̸� 
    private String uname;

    // ���������� 
    private String jsub;

    // �����ü�� 
    private String jcompany;

    // ����о� 
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

    // JobState �� ����
    public void CopyData(JobStateDto param)
    {
        this.jnum = param.getJnum();
        this.uname = param.getUname();
        this.jsub = param.getJsub();
        this.jcompany = param.getJcompany();
        this.jfield = param.getJfield();
    }
}
