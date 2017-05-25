package com.hb.customer.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hb.util.DBcon;

public class FaqDao {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<FaqDto> SelectAll() throws ClassNotFoundException, SQLException{
		String sql = "select * from faq order by fnum desc";
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			FaqDto fbean = new FaqDto();
			fbean.setFnum(rs.getInt("fnum"));
			fbean.setFsub(rs.getString("fsub"));
			fbean.setFacont(rs.getString("facont"));
			fbean.setFdate(rs.getDate("fdate"));
			fbean.setFtype(rs.getInt("ftype"));
			list.add(fbean);
		}
		closeAll();
		
		return list; 
	}
	
	public ArrayList<FaqDto> SelectOne(int ftype) throws ClassNotFoundException, SQLException{
		String sql = "select * from faq where ftype=?";
		ArrayList<FaqDto> list = new ArrayList<FaqDto>();
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, ftype);
		rs = pstmt.executeQuery();
		while(rs.next()){
			FaqDto fbean = new FaqDto();
			fbean.setFnum(rs.getInt("fnum"));
			fbean.setFsub(rs.getString("fsub"));
			fbean.setFacont(rs.getString("facont"));
			fbean.setFdate(rs.getDate("fdate"));
			fbean.setFtype(rs.getInt("ftype"));
			list.add(fbean);
		}
		closeAll();
		
		return list; 
	}
	
	public void closeAll() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
}
