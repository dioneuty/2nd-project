package com.hb.student.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hb.util.DBcon;

public class HomeworkDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<HomeworkDto> SelectOne(String uname) throws ClassNotFoundException, SQLException{
		String sql = "select * from homework where uname = ?";
		ArrayList<HomeworkDto> hlist = new ArrayList<HomeworkDto>();
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uname);
		rs = pstmt.executeQuery();
		while(rs.next()){
			HomeworkDto bean = new HomeworkDto();
			bean.setHnum(rs.getInt("hnum"));
			bean.setHsub(rs.getString("hsub"));
			bean.setUname(rs.getString("uname"));
			bean.setHcont(rs.getString("hcont"));
			bean.setHadd1(rs.getString("hadd_1"));
			bean.setHadd2(rs.getString("hadd_2"));
			bean.setHcheck(rs.getInt("hcheck"));
			hlist.add(bean);
		}
		closeAll();
		return hlist;
	}
	
	public ArrayList<HomeworkDto> SelectAllHmwk() throws ClassNotFoundException, SQLException {
		String sql = "select * from homework";
		ArrayList<HomeworkDto> hlist = new ArrayList<HomeworkDto>();
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			HomeworkDto bean = new HomeworkDto();
			bean.setHnum(rs.getInt("hnum"));
			bean.setHsub(rs.getString("hsub"));
			bean.setUname(rs.getString("uname"));
			bean.setHcont(rs.getString("hcont"));
			bean.setHadd1(rs.getString("hadd_1"));
			bean.setHadd2(rs.getString("hadd_2"));
			bean.setHadd3(rs.getString("hadd_3"));
			bean.setHadd4(rs.getString("hadd_4"));
			bean.setHadd5(rs.getString("hadd_5"));
			bean.setHcheck(rs.getInt("hcheck"));
			hlist.add(bean);
		}
		closeAll();
		return hlist;
	}
	
	public int insertHw(String sub, String cont, String file1,String file2,String file3,String file4,String file5, String uname) throws SQLException, ClassNotFoundException{
		if(file1 == null){
			file1 = "";
		}
		if(file2 == null){
			file2 = "";
		}
		if(file3 == null){
			file3 = "";
		}
		if(file4 == null){
			file4 = "";
		}
		if(file5 == null){
			file5 = "";
		}
		String sql = "insert into homework(hnum,hsub,uname,hcont,hadd_1,hadd_2,hadd_3,hadd_4,hadd_5,hcheck) values (homework_seq.nextval,?,?,?,?,?,?,?,?,1)";
		int result = 0;
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sub);
		pstmt.setString(2, uname);
		pstmt.setString(3, cont);
		pstmt.setString(4, file1);
		pstmt.setString(5, file2);
		pstmt.setString(6, file3);
		pstmt.setString(7, file4);
		pstmt.setString(8, file5);
		result = pstmt.executeUpdate();
		
		return result;
	}
	public void closeAll() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		
}
}
