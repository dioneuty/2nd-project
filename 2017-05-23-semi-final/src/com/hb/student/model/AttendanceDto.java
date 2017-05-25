package com.hb.student.model;

import java.util.Date;

public class AttendanceDto {
	 // 유저번호 
    private Integer unum;

    // 일자 
    private Date atdate;

    // 입실시간 
    private Date stTime;

    // 퇴실시간 
    private Date edTime;

    // 출결상태 
    private Integer state;

    // 강사 승인여부 
    private Integer tcheck;

    public Integer getUnum() {
        return unum;
    }

    public void setUnum(Integer unum) {
        this.unum = unum;
    }

    public Date getAtdate() {
        return atdate;
    }

    public void setAtdate(Date atdate) {
        this.atdate = atdate;
    }

    public Date getStTime() {
        return stTime;
    }

    public void setStTime(Date stTime) {
        this.stTime = stTime;
    }

    public Date getEdTime() {
        return edTime;
    }

    public void setEdTime(Date edTime) {
        this.edTime = edTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getTcheck() {
        return tcheck;
    }

    public void setTcheck(Integer tcheck) {
        this.tcheck = tcheck;
    }

    // Attendance 모델 복사
    public void CopyData(AttendanceDto param)
    {
        this.unum = param.getUnum();
        this.atdate = param.getAtdate();
        this.stTime = param.getStTime();
        this.edTime = param.getEdTime();
        this.state = param.getState();
        this.tcheck = param.getTcheck();
    }
}
