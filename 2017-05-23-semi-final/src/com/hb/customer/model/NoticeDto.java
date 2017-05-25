package com.hb.customer.model;

import java.sql.Date;

public class NoticeDto {
	// 공지번호 
    private Integer nNum;

    // 제목 
    private String nSub;

    // 작성자 
    private String unum;

    // 등록일 
    private Date nDate;

    // 조회수 
    private Integer nCnt;

    // 내용 
    private String nContent;

    public Integer getNNum() {
        return nNum;
    }

    public void setNNum(Integer nNum) {
        this.nNum = nNum;
    }

    public String getNSub() {
        return nSub;
    }

    public void setNSub(String nSub) {
        this.nSub = nSub;
    }

    public String getUnum() {
        return unum;
    }

    public void setUnum(String unum) {
        this.unum = unum;
    }

    public Date getNDate() {
        return nDate;
    }

    public void setNDate(Date nDate) {
        this.nDate = nDate;
    }

    public Integer getNCnt() {
        return nCnt;
    }

    public void setNCnt(Integer nCnt) {
        this.nCnt = nCnt;
    }

    public String getNContent() {
        return nContent;
    }

    public void setNContent(String nContent) {
        this.nContent = nContent;
    }

    // Notice 모델 복사
    public void CopyData(NoticeDto param)
    {
        this.nNum = param.getNNum();
        this.nSub = param.getNSub();
        this.unum = param.getUnum();
        this.nDate = param.getNDate();
        this.nCnt = param.getNCnt();
        this.nContent = param.getNContent();
    }
}
