package com.hb.edu.model;

import java.util.Date;

public class EpilogueDto {
    // �ı��ȣ 
    private Integer epNum;

    // �ı����� 
    private String epSub;

    // �ı⳻�� 
    private String epCont;

    // �ۼ��� 
    private String uname;

    // �ۼ��� 
    private Date epDate;

    public Integer getEpNum() {
        return epNum;
    }

    public void setEpNum(Integer epNum) {
        this.epNum = epNum;
    }

    public String getEpSub() {
        return epSub;
    }

    public void setEpSub(String epSub) {
        this.epSub = epSub;
    }

    public String getEpCont() {
        return epCont;
    }

    public void setEpCont(String epCont) {
        this.epCont = epCont;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public Date getEpDate() {
        return epDate;
    }

    public void setEpDate(Date epDate) {
        this.epDate = epDate;
    }

    // Epilogue �� ����
    public void CopyData(EpilogueDto param)
    {
        this.epNum = param.getEpNum();
        this.epSub = param.getEpSub();
        this.epCont = param.getEpCont();
        this.uname = param.getUname();
        this.epDate = param.getEpDate();
    }
	
}
