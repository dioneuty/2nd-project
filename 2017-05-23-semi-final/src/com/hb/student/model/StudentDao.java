package com.hb.student.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.hb.edu.model.EducationDto;
import com.hb.util.DBcon;

public class StudentDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public StudentDto SelectAll(int unum) throws ClassNotFoundException, SQLException{
		String sql = "select * from student where unum = ?";
		StudentDto bean = new StudentDto();
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, unum);
		rs = pstmt.executeQuery();
		if(rs.next()){
			bean.setUnum(rs.getInt("unum"));
			bean.setEnums(rs.getInt("enum"));
			bean.setFir_sub(rs.getInt("fir_sub"));
			bean.setSec_sub(rs.getInt("sec_sub"));
			bean.setThr_sub(rs.getInt("thr_sub"));
			bean.setS_total(rs.getInt("s_total"));
			bean.setS_append(rs.getInt("s_append"));
			bean.setS_absent(rs.getInt("s_absent"));
			bean.setS_early(rs.getInt("s_early"));
			bean.setS_empoly(rs.getInt("s_empoly"));
			bean.setS_cmpt(rs.getInt("s_cmpt"));
			bean.setS_sucemp(rs.getInt("s_sucemp"));
			closeAll();
		}
		
		return bean; 
	}
	
	public EducationDto stEdu(int enum2) throws ClassNotFoundException, SQLException{
		EducationDto dto = new EducationDto();
		String sql = "select ename,esub1,esub2,esub3 from education where enum = ?";
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, enum2);
		rs = pstmt.executeQuery();
		if(rs.next()){
			dto.setEname(rs.getString("ename"));
			dto.setEsub1(rs.getString("esub1"));
			dto.setEsub2(rs.getString("esub2"));
			dto.setEsub3(rs.getString("esub3"));
			
		}
		closeAll();
		return dto;
	}
	
	public void closeAll() throws SQLException{
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
}
}
