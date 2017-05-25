package com.hb.edu.model;

import java.util.Date;

public class EpilogueDto {
    // 후기번호 
    private Integer epNum;

    // 후기제목 
    private String epSub;

    // 후기내용 
    private String epCont;

    // 작성자 
    private String uname;

    // 작성일 
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

    // Epilogue 모델 복사
    public void CopyData(EpilogueDto param)
    {
        this.epNum = param.getEpNum();
        this.epSub = param.getEpSub();
        this.epCont = param.getEpCont();
        this.uname = param.getUname();
        this.epDate = param.getEpDate();
    }
	
}
