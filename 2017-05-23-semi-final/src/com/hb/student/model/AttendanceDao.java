package com.hb.student.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hb.util.DBcon;

public class AttendanceDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<AttendanceDto> SelectOnes(int unum) throws ClassNotFoundException, SQLException{
		String sql = "select * from attendance where unum = ?";
		ArrayList<AttendanceDto> alist = new ArrayList<AttendanceDto>();
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, unum);
		rs = pstmt.executeQuery();
		if(rs.next()){
			AttendanceDto abean = new AttendanceDto();
			abean.setAtdate(rs.getDate("atdate"));
			abean.setStTime(rs.getDate("st_time"));
			abean.setStTime(rs.getDate("ed_time"));
			abean.setState(rs.getInt("state"));
		}
		closeAll();
		
		return alist;
	}
	
	public void closeAll() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
}
