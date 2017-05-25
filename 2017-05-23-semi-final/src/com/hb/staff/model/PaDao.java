package com.hb.staff.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.util.DBcon;

public class PaDao {
	private static PreparedStatement pstmt;
	private static Connection conn;
	private static ResultSet rs;
	Logger log = Logger.getLogger("com.hb.staff.model.PaDao");

	public static void closeAll(){
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			DBcon.connCnt--;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//TODO isderOneCls
	public int insertOneCls(String ename, String esub1, String esub2,
			String esub3, String startdate, String enddate, int etotalday,
			Integer tchrN, int stnum) throws ClassNotFoundException, SQLException{
		int result = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("insert into education values(education_seq.nextVal,?,?,?,?,?,?,?,(select unum from hanb_user where unum=?),?)");
			pstmt.setString(1, ename);
			pstmt.setString(2, esub1);
			pstmt.setString(3, esub2);
			pstmt.setString(4, esub3);
			pstmt.setString(5, startdate);
			pstmt.setString(6, enddate);
			pstmt.setInt(7, etotalday);
			pstmt.setInt(8, tchrN);			

//		if(tchrN!=null){
//		}else{
//			pstmt.setInt(8, 0);
//		}
			pstmt.setInt(9, stnum);
			result = pstmt.executeUpdate();
			//conn.commit();
		} finally{
			closeAll();
		}
		log.debug("result: " + result);
		return result;
	}
	//TODO selectAllCls
	public JSONArray selectAllCls() throws ClassNotFoundException, SQLException{
		JSONArray elist = new JSONArray();
		JSONObject edto = new JSONObject();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select enum,ename,esub1,esub2,esub3,startdate,enddate,etotalday,a.uname,stnum from hanb_user a, education b where a.unum=b.unum");
			rs = pstmt.executeQuery();
			if(rs.next()){
				do{
					edto = new JSONObject();
					edto.put("enum2", rs.getInt("enum"));
					edto.put("ename", rs.getString("ename"));
					edto.put("esub1", rs.getString("esub1"));
					edto.put("esub2", rs.getString("esub2"));
					edto.put("esub3", rs.getString("esub3"));
					edto.put("startdate", rs.getString("startdate"));
					edto.put("enddate", rs.getString("enddate"));
					edto.put("etotalday", rs.getInt("etotalday"));
					edto.put("uname", rs.getString("uname"));
					edto.put("stnum", rs.getInt("stnum"));
					elist.add(edto);
				}while(rs.next());
			}else{
				edto = new JSONObject();
				edto.put("enum2", 0);
				edto.put("ename", "ename");
				edto.put("esub1", "esub1");
				edto.put("esub2", "esub2");
				edto.put("esub3", "esub3");
				edto.put("startdate", "2017-01-01");
				edto.put("enddate", "2017-01-30");
				edto.put("etotalday", 0);
				edto.put("uname", "0");
				edto.put("stnum", 0);
				elist.add(edto);
			}
			/*while (rs.next()) {
			
			edto.put("enum2", rs.getInt("enum"));
			edto.put("ename", rs.getString("ename");
			edto.put("esub1", rs.getString("esub1"));
			edto.put("esub2", rs.getString("esub2"));
			edto.put("esub3", rs.getString("esub3"));
			edto.put("startdate", rs.getDate("startdate"));
			edto.put("enddate", rs.getDate("enddate"));
			edto.put("etotalday", rs.getInt("etotalday"));
			edto.put("uname", rs.getString("uname"));
			edto.put("stnum", rs.getInt("stnum"));
			elist.add(edto);
		}*/
		} finally{
			closeAll();
		}	
		return elist;
	}
	//TODO PinsertTchr1
	public int PinsertTchr1(String id, String pw, String uname, String email,
			String phone, int cls) throws ClassNotFoundException, SQLException{
		int result=0;
		String tchrName;
		try {
			//1차
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt=conn.prepareStatement("insert into hanb_user values(hanb_user_seq.nextVal,?,?,?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, uname);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setInt(6, 2);
			pstmt.executeUpdate();
			
			//2차
			pstmt=conn.prepareStatement("insert into teacher values( (select unum from hanb_user where uids=?), ?, ?)");
			pstmt.setString(1, id);
			pstmt.setInt(2, cls);
			pstmt.setString(3, uname);//교육번호: enum
			result=pstmt.executeUpdate();
			//conn.commit();
		} finally{
			closeAll();  
		}
		log.debug("result: "+result);
		return result;
	}
		//result=pstmt.executeUpdate();
		/*	
	    pstmt=conn.prepareStatement("select unum from hanb_user where id=?");
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			tchrName=rs.getString("id");
		}*/
		 
	//TODO PinsertOneStaff	
	public int PinsertOneStaff(String id, String pw, String name, String email, String phone, int utype) throws ClassNotFoundException, SQLException{
		int result = 0;
		try {
			//hanb_user 테이블에 추가
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("insert into hanb_user values(hanb_user_seq.nextVal,?,?,?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setInt(6, utype);
			pstmt.executeUpdate();
			
			//staff 테이블에 추가
			pstmt = conn.prepareStatement("insert into staff values((select unum from hanb_user where uids=?),?,?)");
			pstmt.setString(1, id);
			pstmt.setInt(2, utype);
			pstmt.setString(3, name);
			result = pstmt.executeUpdate();
			
			//conn.commit();
		} finally{
			closeAll();
		}
		log.debug("result: " + result);
		return result;
	}

	public JSONObject selectSubsOfOneCls(int enum1) throws ClassNotFoundException, SQLException{
		JSONObject edto = new JSONObject();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select esub1, esub2, esub3 from education where enum=?");
			pstmt.setInt(1, enum1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				edto.put("esub1", rs.getString("esub1"));
				edto.put("esub2", rs.getString("esub2"));
				edto.put("esub3", rs.getString("esub3"));
			}
		} finally{
			closeAll();
		}
		return edto;
	}

	public JSONObject selectSubsOfOneClsUnum(int unum) throws ClassNotFoundException, SQLException{
		JSONObject edto = new JSONObject();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select esub1, esub2, esub3 from education where enum=(select enum from student where unum=?)");
			pstmt.setInt(1, unum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				edto.put("esub1", rs.getString("esub1"));
				edto.put("esub2", rs.getString("esub2"));
				edto.put("esub3", rs.getString("esub3"));
			}
		} finally{
			closeAll();
		}
		return edto;
	}
	/*public int PinsertStffToTable(int unum, int utype){
		int result=0;
		pstmt = conn.prepareStatement("insert into staff values(?,?)");
		pstmt.setInt(1, unum);
		pstmt.setInt(2, utype);
		result = pstmt.executeUpdate();
		log.debug("result: "+result);
		//closeAll();
		return result;
	}*/
	// TODO selectStusAtnd()
	public JSONArray selectStusAtnd() throws ClassNotFoundException, SQLException{
		JSONArray stuList = new JSONArray();
		JSONObject sdto = new JSONObject();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select u.unum, u.uids, u.uname, ename, fir_sub, sec_sub, thr_sub, esub1, esub2, esub3, s_total, s_append, s_early, s_absent, s_empoly, s_cmpt, s_sucemp from hanb_user u, student s, education e where u.unum=s.unum and s.enum=e.enum");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sdto = new JSONObject();
				sdto.put("unum", rs.getInt("unum"));
				sdto.put("uids", rs.getString("uids"));
				sdto.put("uname", rs.getString("uname"));
				sdto.put("ename", rs.getString("ename"));
				sdto.put("fir_sub", rs.getString("fir_sub"));
				sdto.put("sec_sub", rs.getString("sec_sub"));
				sdto.put("thr_sub", rs.getString("thr_sub"));
				sdto.put("esub1", rs.getString("esub1"));
				sdto.put("esub2", rs.getString("esub2"));
				sdto.put("esub3", rs.getString("esub3"));
				sdto.put("s_total", rs.getInt("s_total"));
				sdto.put("s_append", rs.getInt("s_append"));
				sdto.put("s_early", rs.getInt("s_early"));
				sdto.put("s_absent", rs.getInt("s_absent"));
				sdto.put("s_empoly", rs.getInt("s_empoly"));
				sdto.put("s_cmpt", rs.getInt("s_cmpt"));
				sdto.put("s_sucemp", rs.getInt("s_sucemp"));
				stuList.add(sdto);
			}
		} finally{
			closeAll();
		}
		return stuList;
	}
	public boolean checkEname(String ename) throws ClassNotFoundException, SQLException{
		boolean result = false;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(ename) from education where ename=?");
			pstmt.setString(1, ename);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("count(ename)") > 0)
					result = true;
			}
		} finally{
			closeAll();
		}
		return result;
	}
	//TODO modifyStu()
	public int modifyStu(String uids, String ename, String uname, Integer s_append, Integer s_early, Integer s_absent, Integer s_empoly, Integer s_cmpt, Integer s_sucemp) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("update student set uids=?, ename=?, uname=?, s_append=?, s_early=?, s_absent=?, s_empoly=?, s_cmpt=?, s_sucemp=? where uids=?");
			pstmt.setString(1, uids);
			pstmt.setString(2, ename);
			pstmt.setString(3, uname);

			pstmt.setInt(4, s_append);
			pstmt.setInt(5, s_early);
			pstmt.setInt(6, s_absent);
			pstmt.setInt(7, s_empoly);
			pstmt.setInt(8, s_cmpt);
			pstmt.setInt(9, s_sucemp);
			pstmt.setString(10, uids);
			result = pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}
	public JSONObject selectOneStu(Integer unum) throws ClassNotFoundException, SQLException {
		JSONObject sdto = null;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select u.unum, u.uids, u.uname, ename, fir_sub, sec_sub, thr_sub, esub1, esub2, esub3, s_total, s_append, s_early, s_absent, s_empoly, s_cmpt, s_sucemp from hanb_user u, student s, education e where u.unum=? and u.unum=s.unum and s.enum=e.enum;");
			pstmt.setInt(1, unum);
			rs = pstmt.executeQuery();
			if(rs.next()){
				sdto.put("uname",rs.getString("uname"));
				sdto.put("s_append",rs.getInt("s_append"));
				sdto.put("s_early",rs.getInt("s_early"));
				sdto.put("s_absent",rs.getInt(" s_absent"));
				sdto.put("s_empoly",rs.getInt("s_empoly"));
				sdto.put("s_cmpt",rs.getInt("s_cmpt"));
				sdto.put("s_sucemp",rs.getInt("s_sucemp"));
			}
		}finally{
			closeAll();
		}
		return sdto;
	}
	public int delStuAndUtype0(Integer unum) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("delete from student where unum=?");
			pstmt.setInt(1, unum);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("update hanb_user set utype=-1 where unum=?");
			pstmt.setInt(1, unum);
			result = pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}
	public int delStuDelUser(Integer unum) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("delete from student where unum=?");
			pstmt.setInt(1, unum);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("delete from hanb_user where unum=?");
			pstmt.setInt(1, unum);
			result = pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}
	public int delTchrAndUtype0(Integer unum) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("delete from teacher where unum=?");
			pstmt.setInt(1, unum);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("update hanb_user set utype=-1 where unum=?");
			pstmt.setInt(1, unum);
			result = pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}
	public int delTchrDelUser(Integer unum) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("delete from teacher where unum=?");
			pstmt.setInt(1, unum);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("delete from hanb_user where unum=?");
			pstmt.setInt(1, unum);
			result = pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}
	
	/*
	delete from education where enum=?
	update teacher set enum=0 where enum=?;
	update student set enum=0 where enum=?
	update student set fir_sub='', sec_sub='', thr_sub='' where enum=?; 
	*/
	public int delCls(Integer enum2) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("delete from education where enum=?");
			pstmt.setInt(1, enum2);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("update student set fir_sub='', sec_sub='', thr_sub='' where enum=?");
			pstmt.setInt(1, enum2);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("update student set enum=0 where enum=?");
			pstmt.setInt(1, enum2);
			result = pstmt.executeUpdate();
			
		}finally{
			closeAll();
		}
		return result;
	}
	public JSONArray selectAllTchrs() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select t.unum,t.enum,u.uname,u.uids from teacher t, hanb_user u where t.unum=u.unum");
			rs = pstmt.executeQuery();
			while(rs.next()){
				JSONObject tdto = new JSONObject();
				tdto.put("uids", rs.getString("uids"));
				tdto.put("unum", rs.getInt("unum"));
				tdto.put("enum2", rs.getInt("enum"));
				tdto.put("uname", rs.getString("uname"));
				list.add(tdto);
			}
		}finally{
			closeAll();
		}
		return list;
	}
	public int modifyTchr(Integer enum2, Integer unum, String tchrName) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("update teacher set enum=? where unum=?");
			pstmt.setInt(1, enum2);
			pstmt.setInt(2, unum);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("update hanb_user set uname=? where unum=?");
			pstmt.setString(1, tchrName);
			pstmt.setInt(2, unum);
			
			result = pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		
		return result;
	}
	public int modifyStf(Integer unum, Integer utype, String uname) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("update staff set unum=?, utype=? where unum=?");
			pstmt.setInt(1, unum);
			pstmt.setInt(2, utype);
			pstmt.setInt(3, unum);
			pstmt.executeUpdate();
			
			String tmpName = null;
			pstmt = conn.prepareStatement("select uname from hanb_user where unum=?");
			pstmt.setInt(1, unum);
			rs = pstmt.executeQuery();
			if(rs.next()){
				tmpName=rs.getString("uname");
			}
			
			if(tmpName != uname){
			
				pstmt = conn.prepareStatement("update hanb_user set uname=?, utype=? where unum=?");
				pstmt.setString(1, uname);
				pstmt.setInt(2, utype);
				pstmt.setInt(3, unum);
				result = pstmt.executeUpdate();
			
			}else if(tmpName == uname){
				
				pstmt = conn.prepareStatement("update hanb_user set utype=? where unum=?");
				pstmt.setInt(1, utype);
				pstmt.setInt(2, unum);
				result = pstmt.executeUpdate();
			}
			
		}finally{
			closeAll();
		}
		return result;
	}
	
	public int modifyCls(String ename, String esub1, String esub2, String esub3, String startdate, String enddate, int etotalday, Integer tchrN, int stnum, int enum2) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			//교육 정보 변경
			pstmt = conn.prepareStatement("update education set ename=?, esub1=?, esub2=?, esub3=?, startdate=?, enddate=?, etotalday=?, unum=?, stnum=? where enum=?");
			pstmt.setString(1,ename);
			pstmt.setString(2,esub1);
			pstmt.setString(3,esub2);
			pstmt.setString(4,esub3);
			pstmt.setString(5,startdate);
			pstmt.setString(6,enddate);
			pstmt.setInt(7,etotalday);
			pstmt.setInt(8,tchrN);
			pstmt.setInt(9,stnum);
			pstmt.setInt(10,enum2);
			pstmt.executeUpdate();

			//기존의 강사 초기화
			pstmt = conn.prepareStatement("update teacher enum=0 where enum=?");
			pstmt.setInt(1,enum2);
			pstmt.executeUpdate();

			//강사 정보 변경
			pstmt = conn.prepareStatement("update teacher enum=? where unum=?");
			pstmt.setInt(1,enum2);
			pstmt.setInt(2,tchrN);
			result = pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}
	
	public JSONArray selectAllStfs() throws ClassNotFoundException, SQLException {
		JSONArray list=new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select unum,utype,uname from staff");
			rs= pstmt.executeQuery();
			while(rs.next()){
				JSONObject udto = new JSONObject();
				udto.put("unum", rs.getInt("unum"));
				udto.put("utype", rs.getInt("utype"));
				udto.put("uname", rs.getString("uname"));
				list.add(udto);
			}
		}finally{
			closeAll();
		}
		return list;
	}
	
	
	
	public JSONObject selectOneStf(Integer unum) throws ClassNotFoundException, SQLException {
		JSONObject udto = new JSONObject();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select unum,utype,uname from staff where unum=?");
			pstmt.setInt(1, unum);
			rs = pstmt.executeQuery();
			if(rs.next()){
				udto.put("unum", rs.getInt("unum"));
				udto.put("utype", rs.getInt("utype"));
				udto.put("uname", rs.getString("uname"));
			}
		}finally{
			closeAll();
		}
		return udto;
	}
	
	public JSONArray selectNoclsTchrs() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select t.unum,t.enum,u.uname,u.uids from teacher t, hanb_user u where enum=? and t.unum=u.unum and b.utype=2");
			pstmt.setInt(1, 0);
			pstmt.setInt(2, 2);
			rs= pstmt.executeQuery();
			while(rs.next()){
				JSONObject udto = new JSONObject();
				udto.put("unum", rs.getInt("unum"));
				udto.put("enum", rs.getInt("enum"));
				udto.put("uname", rs.getString("uname"));
				udto.put("uids", rs.getString("uids"));
				list.add(udto);
			}
		}finally{
			closeAll();
		}
		return list;
	}
	
	
	
	
}