package com.hb.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBcon {
	private static Connection conn = null;
	private static String driver="oracle.jdbc.driver.OracleDriver";
	private static String url="jdbc:oracle:thin:@localhost:1521:xe";
	private static String user="scott";
	private static String pass="tiger";
	public static int connCnt=0;
	
	public static Connection getConnection() throws SQLException, ClassNotFoundException{
		if(conn == null || conn.isClosed()){
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,pass);
			connCnt++;
		}
		
		return conn;
	}
	public static void manualCommit() throws SQLException {
		//conn.setAutoCommit(false);
	}
	public static void rollback() throws SQLException {
		conn.rollback();
	}
	public static void commit() throws SQLException {
		//conn.commit();
	}
}
