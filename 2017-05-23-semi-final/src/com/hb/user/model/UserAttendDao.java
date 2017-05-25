package com.hb.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.hb.util.DBcon;

public class UserAttendDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<UserAttendDto> selectAll(int unum) throws ClassNotFoundException, SQLException {
		ArrayList<UserAttendDto> atlist = new ArrayList<UserAttendDto>();
		String sql = "SELECT * FROM attendance where unum = ? order by atdate desc";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, unum);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			UserAttendDto atbean = new UserAttendDto();
			atbean.setUnum(rs.getInt("unum"));
			atbean.setAtdate(rs.getDate("atdate"));
			atbean.setSt_time(rs.getString("st_time"));
			atbean.setEd_time(rs.getString("ed_time"));
			atbean.setState(rs.getInt("state"));
			atbean.setTcheck(rs.getInt("tcheck"));
			atlist.add(atbean);
		}
		closeAll();
			return atlist;
	}
	public int selectOne(int unum) throws ClassNotFoundException, SQLException {
		int result = 0;
		String sql = "SELECT count(*) as cnt FROM attendance where unum = ? and to_date(atdate,'yyyy/mm/dd') = to_date(sysdate,'yyyy/mm/dd')";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, unum);
		rs = pstmt.executeQuery();
		if (rs.next()) {	
			result = rs.getInt("cnt");
		}
		closeAll();
			return result;
	}
	
	public int selectState(int unum) throws ClassNotFoundException, SQLException {
		int result = 0;
		String sql = "SELECT state FROM attendance where unum = ? and to_date(atdate,'yyyy/mm/dd') = to_date(sysdate,'yyyy/mm/dd')";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, unum);
		rs = pstmt.executeQuery();
		if (rs.next()) {	
			result = rs.getInt("state");
		}
		closeAll();
			return result;
	}
	
	public int insertStart(int unum) throws ClassNotFoundException, SQLException {
		int result = 0;
		String sql = "insert into attendance(unum,atdate,st_time,ed_time,state,tcheck) values"
				+ " (?,sysdate,'00:00','00:00',0,0)";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, unum);
		result = pstmt.executeUpdate();
				
		closeAll();
		
		return result;
	}
	public int updateStart(int unum,String st_times) throws ClassNotFoundException, SQLException {
		int result = 0;
		String sql = "update attendance set st_time = '"+st_times+"', state = 1  where unum = ? and to_date(atdate,'yyyy/mm/dd') = to_date(sysdate,'yyyy/mm/dd')";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, unum);
		result = pstmt.executeUpdate();
				
		closeAll();
		
		return result;
	}
	public int updateEnd(int unum,String ed_times) throws ClassNotFoundException, SQLException {
		int result = 0;
		String sql = "update attendance set ed_time = '"+ed_times+"' where unum = ? and to_date(atdate,'yyyy/mm/dd') = to_date(sysdate,'yyyy/mm/dd')";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, unum);
		result = pstmt.executeUpdate();
				
		closeAll();
		
		return result;
	}
	
	
	public void closeAll() throws SQLException{
		if(rs != null){
			rs.close();
		}
		if(pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	}
}
