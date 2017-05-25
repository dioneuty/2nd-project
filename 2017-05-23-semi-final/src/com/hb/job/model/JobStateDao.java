package com.hb.job.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hb.util.DBcon;

public class JobStateDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<JobStateDto> selectAll() throws ClassNotFoundException, SQLException {
		ArrayList<JobStateDto> jslist = new ArrayList<JobStateDto>();
		String sql = "SELECT * FROM job_state order by jnum desc";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			JobStateDto jsbean = new JobStateDto();
			jsbean.setJnum(rs.getInt("jnum"));
			jsbean.setUname(rs.getString("uname"));
			jsbean.setJsub(rs.getString("jsub"));
			jsbean.setJcompany(rs.getString("jcompany"));
			jsbean.setJfield(rs.getString("jfield"));
			jslist.add(jsbean);
		}
		closeAll();
			return jslist;
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
