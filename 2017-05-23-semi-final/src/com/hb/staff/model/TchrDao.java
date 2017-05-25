package com.hb.staff.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

import com.hb.user.model.UserAttendDto;
import com.hb.util.DBcon;

public class TchrDao {
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	Logger log = Logger.getLogger("com.hb.staff.model.TchrDao");
		
	public static void closeAll(){
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	public int insertAttend(int unum, String atdate,
			String stTime, String edTime, int atStatus) throws ClassNotFoundException, SQLException{
		UserAttendDto uadto = new UserAttendDto();
		int result = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			String sql="insert into attendance (unum,atdate,st_time,ed_time,state) values(?,(to_date(?,'yyyy-mm-dd')),(to_date(?,'hh24:mi')),(to_date(?,'hh24:mi')),?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, unum);
			pstmt.setString(2, atdate);
			pstmt.setString(3, stTime);
			pstmt.setString(4, edTime);
			pstmt.setInt(5, atStatus);
			result = pstmt.executeUpdate();
			
			} finally{
				closeAll();
			}
		return result;
	}

	public int updateScore(int unum, String fir_sub, String sec_sub,
			String thr_sub) throws ClassNotFoundException, SQLException{
		int result = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("update student set fir_sub=?, sec_sub=?, thr_sub=? where unum=?");
			pstmt.setString(1, fir_sub);
			pstmt.setString(2, sec_sub);
			pstmt.setString(3, thr_sub);
			pstmt.setInt(4, unum);
			result = pstmt.executeUpdate();
			
			} finally{
				closeAll();
			}
		return result;
	}

}
	