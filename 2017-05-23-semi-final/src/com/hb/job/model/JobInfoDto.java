package com.hb.job.model;

import java.util.Date;

public class JobInfoDto {
	 // ä��������ȣ 
    private Integer jiNum;

    // ��ü�� 
    private String jiComp;

    // ���� 
    private String jiArea;

    // �����ο� 
    private Integer jiRecruit;

    // ������� 
    private String jiType;

    // ������¥ 
    private String jiEnddate;

    // �ۼ��� 
    private Date jiDate;

    // �޿� 
    private String jiPay;

    // ����ó 
    private String jiPhone;

    // ä�볻�� 
    private String jiCont;

    public Integer getJiNum() {
        return jiNum;
    }

    public void setJiNum(Integer jiNum) {
        this.jiNum = jiNum;
    }

    public String getJiComp() {
        return jiComp;
    }

    public void setJiComp(String jiComp) {
        this.jiComp = jiComp;
    }

    public String getJiArea() {
        return jiArea;
    }

    public void setJiArea(String jiArea) {
        this.jiArea = jiArea;
    }

    public Integer getJiRecruit() {
        return jiRecruit;
    }

    public void setJiRecruit(Integer jiRecruit) {
        this.jiRecruit = jiRecruit;
    }

    public String getJiType() {
        return jiType;
    }

    public void setJiType(String jiType) {
        this.jiType = jiType;
    }

    public String getJiEnddate() {
        return jiEnddate;
    }

    public void setJiEnddate(String jiEnddate) {
        this.jiEnddate = jiEnddate;
    }

    public Date getJiDate() {
        return jiDate;
    }

    public void setJiDate(Date jiDate) {
        this.jiDate = jiDate;
    }

    public String getJiPay() {
        return jiPay;
    }

    public void setJiPay(String jiPay) {
        this.jiPay = jiPay;
    }

    public String getJiPhone() {
        return jiPhone;
    }

    public void setJiPhone(String jiPhone) {
        this.jiPhone = jiPhone;
    }

    public String getJiCont() {
        return jiCont;
    }

    public void setJiCont(String jiCont) {
        this.jiCont = jiCont;
    }

    // JobInfo �� ����
    public void CopyData(JobInfoDto param)
    {
        this.jiNum = param.getJiNum();
        this.jiComp = param.getJiComp();
        this.jiArea = param.getJiArea();
        this.jiRecruit = param.getJiRecruit();
        this.jiType = param.getJiType();
        this.jiEnddate = param.getJiEnddate();
        this.jiDate = param.getJiDate();
        this.jiPay = param.getJiPay();
        this.jiPhone = param.getJiPhone();
        this.jiCont = param.getJiCont();
    }

}
