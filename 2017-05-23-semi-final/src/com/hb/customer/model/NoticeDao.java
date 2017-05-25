package com.hb.customer.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hb.util.DBcon;

public class NoticeDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<NoticeDto> SelectAll() throws ClassNotFoundException, SQLException{
		String sql = "select * from notice order by n_num desc";
		ArrayList<NoticeDto> list = new ArrayList<NoticeDto>();
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			NoticeDto nbean = new NoticeDto();
			nbean.setNNum(rs.getInt("n_num"));
			nbean.setNSub(rs.getString("n_sub"));
			nbean.setNContent(rs.getString("n_content"));
			nbean.setUnum(rs.getString("unum"));
			nbean.setNDate(rs.getDate("n_date"));
			list.add(nbean);
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
