package com.hb.staff.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.util.DBcon;

public class BsnsDao {
	private static PreparedStatement pstmt;
	private static Connection conn;
	private static ResultSet rs;

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
	
	public JSONArray selectAllCnsltMembers() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select uids, uname, uphone from hanb_user where utype=0");
			rs = pstmt.executeQuery();
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("uids",rs.getString("uids"));
				obj.put("uname",rs.getString("uname"));
				obj.put("uphone",rs.getString("uphone"));
				list.add(obj);
			}
		}finally{
			closeAll();
		}
		return list;
	}
	
}
