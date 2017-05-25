package com.hb.edu.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hb.util.DBcon;

public class EpilogueDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<EpilogueDto> selectAll() throws ClassNotFoundException, SQLException {
		ArrayList<EpilogueDto> eplist = new ArrayList<EpilogueDto>();
		String sql = "SELECT * FROM epilogue order by ep_num desc";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			EpilogueDto epbean = new EpilogueDto();
			epbean.setEpNum(rs.getInt("ep_num"));
			epbean.setEpCont(rs.getString("ep_cont"));
			epbean.setUname(rs.getString("uname"));
			epbean.setEpDate(rs.getDate("ep_date"));
			eplist.add(epbean);
		}
		closeAll();
			return eplist;
	}
	
	
	public int insertOne(String epcont,String uname) throws ClassNotFoundException, SQLException {
		int result = 0;
		String sql = "insert into epilogue(ep_num,ep_cont,uname,ep_date) values (epilogue_seq.nextval,?,?,sysdate)";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, epcont);
		pstmt.setString(2, uname);
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
