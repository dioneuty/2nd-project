package com.hb.student.model;

public class HomeworkDto {

	    private Integer hnum;

	    private String hsub;

	    private String uname;

	    private String hcont;

	    private String hadd1;

	    private String hadd2;
	    
	    private String hadd3;
	    
	    private String hadd4;
	    
	    private String hadd5;

	    private Integer hcheck;
	    
	    public HomeworkDto() {
			// TODO Auto-generated constructor stub
		}

	    public Integer getHnum() {
	        return hnum;
	    }

	    public void setHnum(Integer hnum) {
	        this.hnum = hnum;
	    }

	    public String getHsub() {
	        return hsub;
	    }

	    public void setHsub(String hsub) {
	        this.hsub = hsub;
	    }

	    public String getUname() {
	        return uname;
	    }

	    public void setUname(String uname) {
	        this.uname = uname;
	    }

	    public String getHcont() {
	        return hcont;
	    }

	    public void setHcont(String hcont) {
	        this.hcont = hcont;
	    }

	    public String getHadd1() {
	        return hadd1;
	    }

	    public void setHadd1(String hadd1) {
	        this.hadd1 = hadd1;
	    }

	    public String getHadd2() {
	        return hadd2;
	    }

	    public void setHadd2(String hadd2) {
	        this.hadd2 = hadd2;
	    }

	    public Integer getHcheck() {
	        return hcheck;
	    }

	    public void setHcheck(Integer hcheck) {
	        this.hcheck = hcheck;
	    }
	    
	    public String getHadd3() {
			return hadd3;
		}

		public void setHadd3(String hadd3) {
			this.hadd3 = hadd3;
		}

		public String getHadd4() {
			return hadd4;
		}

		public void setHadd4(String hadd4) {
			this.hadd4 = hadd4;
		}

		public String getHadd5() {
			return hadd5;
		}

		public void setHadd5(String hadd5) {
			this.hadd5 = hadd5;
		}

		// Homework �� ����
	    public void CopyData(HomeworkDto param)
	    {
	        this.hnum = param.getHnum();
	        this.hsub = param.getHsub();
	        this.uname = param.getUname();
	        this.hcont = param.getHcont();
	        this.hadd1 = param.getHadd1();
	        this.hadd2 = param.getHadd2();
	        this.hcheck = param.getHcheck();
	    }
	}


