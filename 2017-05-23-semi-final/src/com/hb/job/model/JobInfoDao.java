package com.hb.job.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hb.util.DBcon;

public class JobInfoDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ArrayList<JobInfoDto> selectAll() throws ClassNotFoundException, SQLException {
		ArrayList<JobInfoDto> jilist = new ArrayList<JobInfoDto>();
		String sql = "SELECT * FROM job_info  order by ji_num desc";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			JobInfoDto jibean = new JobInfoDto();
			jibean.setJiNum(rs.getInt("ji_num"));
			jibean.setJiComp(rs.getString("ji_comp"));
			jibean.setJiArea(rs.getString("ji_area"));
			jibean.setJiRecruit(rs.getInt("ji_recruit"));
			jibean.setJiType(rs.getString("ji_type"));
			jibean.setJiEnddate(rs.getString("ji_enddate"));
			jibean.setJiDate(rs.getDate("ji_date"));
			jibean.setJiPay(rs.getString("ji_pay"));
			jibean.setJiPhone(rs.getString("ji_phone"));
			jibean.setJiCont(rs.getString("ji_cont"));
			jilist.add(jibean);
		}
		closeAll();
			return jilist;
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
