package com.hb.staff.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.util.DBcon;

public class JbSptDao {
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
	
	public JSONArray selectAllWait() throws ClassNotFoundException, SQLException {
		JSONArray list=new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select u.uname, u.uids, e.ename, s_empoly, s_sucemp  from student s, hanb_user u, education e where u.unum=s.unum and s.s_empoly=? and s.s_sucemp=? and e.enum=s.enum");
			pstmt.setInt(1, 0);
			pstmt.setInt(2, 0);
			rs = pstmt.executeQuery();
			while(rs.next()){
				JSONObject udto = new JSONObject();
				udto.put("uname", rs.getString("uname"));
				udto.put("uids", rs.getString("uids"));
				udto.put("ename", rs.getString("ename"));
				udto.put("s_empoly", rs.getInt("s_empoly"));
				udto.put("s_sucemp", rs.getInt("s_sucemp"));
				list.add(udto);
			}
		}finally{
			closeAll();
		}
		return list;
	}

	public JSONArray selectAllNewJobs() throws ClassNotFoundException, SQLException {
		JSONArray list=new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select ji_comp,ji_date,ji_recruit,ji_type,ji_enddate from job_info");
			rs = pstmt.executeQuery();
			while( rs.next() ){
				JSONObject jdto = new JSONObject();
				jdto.put("ji_comp", rs.getString("ji_comp"));
				jdto.put("ji_date", rs.getString("ji_date"));
				jdto.put("ji_recruit", rs.getInt("ji_recruit"));	
				jdto.put("ji_type", rs.getString("ji_type"));
				jdto.put("ji_enddate", rs.getString("ji_enddate"));
				list.add(jdto);
			}
		}finally{
			closeAll();
		}
		return list;
	}


}
