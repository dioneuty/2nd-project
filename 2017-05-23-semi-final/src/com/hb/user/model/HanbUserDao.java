package com.hb.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.util.DBcon;

public class HanbUserDao {
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	Logger log = Logger.getLogger("com.hb.user.model.HanbUserDao");


	public static void closeAll(){
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
			DBcon.connCnt--;
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	public JSONArray SelectAll() throws ClassNotFoundException, SQLException{
		String sql = "SELECT * FROM HANB_USER where utype = ?";
		int utype = 0;
		JSONArray list = new JSONArray();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, utype);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JSONObject udto = new JSONObject();
				udto.put("unum",rs.getInt("unum"));
				udto.put("uids", rs.getString("uids"));
				udto.put("upw", rs.getString("upw"));
				udto.put("uname", rs.getString("uname"));
				udto.put("uemail", rs.getString("uemail"));
				udto.put("uphone", rs.getString("uphone"));
				udto.put("utype", rs.getInt("utype"));
				list.add(udto);
			}
		} finally{
			closeAll();
		}
		return list;
	}

	public int selectUnum(String id) throws ClassNotFoundException, SQLException{
		int unum = 0;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select unum from hanb_user where uids=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				unum = rs.getInt("unum");
			}
		} finally{
			closeAll();
		}
		return unum;
	}
	
	public int updateSelf(int unum, String uids, String upw, String uemail, String uphone, int utype) throws ClassNotFoundException, SQLException {
		int result = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			
			pstmt = conn.prepareStatement("update hanb_user set uids=?, upw=?, uemail=?, uphone=? where unum=?)");
			pstmt.setString(1, uids);
			pstmt.setString(2, upw);
			pstmt.setString(3, uemail);
			pstmt.setString(4, uphone);
			pstmt.setInt(5, unum);
			pstmt.setInt(6, 1);
			result = pstmt.executeUpdate();
			//conn.commit();
		} finally{
			closeAll();
		}
		
		return result;
	}
	
	public String selectUname(String uid) throws ClassNotFoundException, SQLException{
		String uname = "";
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select uname from hanb_user where uids=?");
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uname = rs.getString("uname");
			}
		} finally{
			closeAll();
		}
		return uname;
	}
	
	public String selectUid(String uname) throws ClassNotFoundException, SQLException{
		String uid = "";
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select uid from hanb_user where uname=?");
			pstmt.setString(1, uname);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uid = rs.getString("uid");
			}
		} finally{
			closeAll();
		}
		return uid;
	}
	
	public ArrayList<String> checkIds() throws ClassNotFoundException, SQLException{
		String sql = "SELECT uids FROM HANB_USER";
		ArrayList<String> chk = new ArrayList<String>();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				String check = rs.getString("uids");
				chk.add(check);
			}
		} finally{
			closeAll();
		}
		return chk;
	}
	
	public int findId(String uid) throws ClassNotFoundException, SQLException{
		String sql = "SELECT count(*) as cnt FROM HANB_USER where uids = ?";
		int cnt = 0;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} finally{
			closeAll();
		}
		return cnt;
	}
	
	public int checkphone(String uid, String uphone) throws ClassNotFoundException, SQLException{
		String sql = "SELECT count(*) as cnt FROM HANB_USER where uphone =? and uids = ?";
		int cnt = 0;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uphone);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} finally{
			closeAll();
		}
		return cnt;
	}
	
	public int checkemail(String uid, String uemail) throws ClassNotFoundException, SQLException{
		String sql = "SELECT count(*) as cnt FROM HANB_USER where uemail =? and uids = ?";
		int cnt = 0;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uemail);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} finally{
			closeAll();
		}
		return cnt;
	}
	
	public String findpw(String uid, String uemail) throws ClassNotFoundException, SQLException{
		String sql = "SELECT upw FROM HANB_USER where uemail =? and uids = ?";
		String upw = "";
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uemail);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				upw = rs.getString("upw");
			}
		} finally{
			closeAll();
		}
		return upw;
	}
	
	public String findpws(String uid, String uphone) throws ClassNotFoundException, SQLException{
		String sql = "SELECT upw FROM HANB_USER where uphone =? and uids = ?";
		String upw = "";
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uphone);
			pstmt.setString(2, uid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				upw = rs.getString("upw");
			}
		} finally{
			closeAll();
		}
		return upw;
	}
	
	public String findide(String uemail) throws ClassNotFoundException, SQLException{
		String sql = "SELECT uids FROM HANB_USER where uemail =?";
		String uid = "";
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uemail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uid = rs.getString("uids");
			}
		} finally{
			closeAll();
		}
		return uid;
	}
	
	public String findidp(String uphone) throws ClassNotFoundException, SQLException{
		String sql = "SELECT uids FROM HANB_USER where uphone =?";
		String uid = "";
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uphone);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				uid = rs.getString("uids");
			}
		} finally{
			closeAll();
		}
		return uid;
	}
	
	public JSONObject selectOne(String uids) throws ClassNotFoundException, SQLException{
		String sql = "SELECT * FROM HANB_USER where uids=?";
		JSONObject udto = new JSONObject();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uids);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				udto.put("unum",rs.getInt("unum"));
				udto.put("uids", rs.getString("uids"));
				udto.put("upw", rs.getString("upw"));
				udto.put("uname", rs.getString("uname"));
				udto.put("uemail", rs.getString("uemail"));
				udto.put("uphone", rs.getString("uphone"));
				udto.put("utype", rs.getInt("utype"));
			}
		} finally{
			closeAll();
		}
		return udto;
	}
	public HanbUserDto selectOnes(String uids) throws ClassNotFoundException, SQLException{
		String sql = "SELECT * FROM HANB_USER where uids=?";
		HanbUserDto udto = new HanbUserDto();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uids);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				udto.setUnum(rs.getInt("unum"));
				udto.setUids(rs.getString("uids"));
				udto.setUpw(rs.getString("upw"));
				udto.setUname(rs.getString("uname"));
				udto.setUemail(rs.getString("uemail"));
				udto.setUphone(rs.getString("uphone"));
				udto.setUtype(rs.getInt("utype"));
			}
		} finally{
			closeAll();
		}
		return udto;
	}
	// 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쌘곤옙 회占쏙옙 占쌩곤옙(BusinessInsertOne)
	public int BinsertOne(String id, String pw, String uname, String email, String phone) throws ClassNotFoundException, SQLException{
		int result = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("insert into hanb_user values(hanb_user_seq.nextVal,?,?,?,?,?,?)");
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, uname);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setInt(6, 1);
			result = pstmt.executeUpdate();
			//conn.commit();
		} finally{
			closeAll();
		}
		log.debug("result: " + result);
		
		return result;
	}

	public int BupgradeToOneStu(String id) throws ClassNotFoundException, SQLException{
		int result = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("update hanb_user set utype=1 where uids=?");
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			//conn.commit();
		} finally{
			closeAll();
		}
		return result;
	}

	public int insertOne(String uids, String upw, String uname, String uemail, String uphone, int utype) throws ClassNotFoundException, SQLException{
		int result = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("insert into hanb_user values(hanb_user_seq.nextval,?,?,?,?,?,?)");
			pstmt.setString(1, uids);
			pstmt.setString(2, upw);
			pstmt.setString(3, uname);
			pstmt.setString(4, uemail);
			pstmt.setString(5, uphone);
			pstmt.setInt(6, utype);
			result = pstmt.executeUpdate();
			
			switch(utype){
			case 2:
				pstmt = conn.prepareStatement("insert into teacher values((select unum from hanb_user where uids=?),0)");
				pstmt.setString(1, uids);
				result = pstmt.executeUpdate();
				break;
			case 3:
				pstmt = conn.prepareStatement("insert into staff values((select unum from hanb_user where uids=?),3,?)");
				pstmt.setString(1, uids);
				pstmt.setString(2, uname);
				result = pstmt.executeUpdate();
				break;
			case 4:
				pstmt = conn.prepareStatement("insert into staff values((select unum from hanb_user where uids=?),4,?)");
				pstmt.setString(1, uids);
				pstmt.setString(2, uname);
				result = pstmt.executeUpdate();
				break;
			case 5:
				pstmt = conn.prepareStatement("insert into staff values((select unum from hanb_user where uids=?),5,?)");
				pstmt.setString(1, uids);
				pstmt.setString(2, uname);
				result = pstmt.executeUpdate();
				break;
			case 6:
				pstmt = conn.prepareStatement("insert into staff values((select unum from hanb_user where uids=?),6,?)");
				pstmt.setString(1, uids);
				pstmt.setString(2, uname);
				result = pstmt.executeUpdate();
				break;
			default:
				break;
			}
			
			//conn.commit();
		} finally{
			closeAll();
		}
		return result;
	}

	// 占쏙옙占쏙옙占쏙옙占싱븝옙 占십울옙
	public int BinsertOneStu(int unum, int enum1, String firsub, String secsub, String thrsub) throws ClassNotFoundException, SQLException{
		int result = 0;
		int etotalday = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("select etotalday from education where enum=?");
			pstmt.setInt(1, enum1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				etotalday = rs.getInt("etotalday");
			}
			pstmt = conn.prepareStatement("insert into student (unum,enum,fir_sub,sec_sub,thr_sub,s_total) values(?, ?, ?, ?, ?, ?)");
			pstmt.setInt(1, unum);
			pstmt.setInt(2, enum1);
			pstmt.setString(3, firsub);
			pstmt.setString(4, secsub);
			pstmt.setString(5, thrsub);
			pstmt.setInt(6, etotalday);
			result = pstmt.executeUpdate();
			//conn.commit();
		} finally{
			closeAll();
		}
		log.debug("result: " + result);
		// insert into student (unum,enum,fir_sub,sec_sub,thr_sub)
		// values((select unum from hanb_user where uids='admin'), 3, 'sss',
		// 'sds', 'efe');

		return result;
	}

	public int updateOneStuAtnd(int unum, int atStatus) throws ClassNotFoundException, SQLException{
		int result = 0;
		int s_total = 0;
		int s_append = 0;
		int s_early = 0;
		int s_absent = 0;
		int enum1 = 0;
		try {
			conn = DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("select enum, s_total, s_append, s_early, s_absent from student where unum=?");
			pstmt.setInt(1, unum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				enum1 = rs.getInt("enum");
				s_total = rs.getInt("s_total");
				s_append = rs.getInt("s_append");
				s_early = rs.getInt("s_early");
				s_absent = rs.getInt("s_absent");
			}
			// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 sql 占쏙옙 占쏙옙占쏙옙//
			switch (atStatus) {
			case 0:
				s_absent++;
				pstmt = conn.prepareStatement("update student set s_absent=? where unum=? and enum=?");
				pstmt.setInt(1, s_absent);
				pstmt.setInt(2, unum);
				pstmt.setInt(3, enum1);
				result = pstmt.executeUpdate();
				break;
			case 1:
				s_append++;
				pstmt = conn.prepareStatement("update student set s_append=? where unum=? and enum=?");
				pstmt.setInt(1, s_append);
				pstmt.setInt(2, unum);
				pstmt.setInt(3, enum1);
				result = pstmt.executeUpdate();
				break;
			case 2:
			case 3:
				s_early++;
				pstmt = conn.prepareStatement("update student set s_early=? where unum=? and enum=?");
				pstmt.setInt(1, s_early);
				pstmt.setInt(2, unum);
				pstmt.setInt(3, enum1);
				result = pstmt.executeUpdate();
				break;
			default:
				break;
			}
			//conn.commit();
		} finally{
			closeAll();
		}
		return result;
	}

	public int LoginChk(String uids, String upw) throws ClassNotFoundException, SQLException{
		String sql = "SELECT count(*) as cnt FROM HANB_USER where uids=? and upw=?";
		int result = 0;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uids);
			pstmt.setString(2, upw);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} finally{
			closeAll();
		}
		return result;
	}

	public int joinChk(String uids) throws ClassNotFoundException, SQLException{
		String sql = "SELECT count(*) as cnt FROM HANB_USER where uids=?";
		int result = 0;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uids);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt("cnt");
			}
		} finally{
			closeAll();
		}	
		return result;
	}

	public JSONArray selectAllNotStu() throws ClassNotFoundException, SQLException{
		JSONArray list = new JSONArray();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select unum,uids,uname,utype from hanb_user where utype=0");
			;
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JSONObject bean = new JSONObject();
				bean.put("unum",rs.getInt("unum"));
				bean.put("uids", rs.getString("uids"));
				bean.put("uname", rs.getString("uname"));
				bean.put("utype", rs.getInt("utype"));
				list.add(bean);
			}
		} finally{
			closeAll();
		}	
		return list;
	}

	public JSONArray selectTchrs() throws ClassNotFoundException, SQLException{
		JSONObject udto = null;
		JSONArray ulist = new JSONArray();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select uname,unum from hanb_user where utype=?");
			pstmt.setInt(1, 2);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				do {
					udto = new JSONObject();
					udto.put("uname", rs.getString("uname"));
					udto.put("unum",rs.getInt("unum"));
					ulist.add(udto);
				} while (rs.next());
				/*
				 * do { udto.setUname(rs.getString("uname"));
				 * udto.setUnum(rs.getInt("unum")); ulist.add(udto); }
				 * while(rs.next());
				 */
			} else {
				udto.put("unum",0);
				udto.put("uname","占썩본");
				ulist.add(udto);
			}
		} finally{
			closeAll();
		}	
		return ulist;
	}

	public JSONArray selectTchrAll() throws ClassNotFoundException, SQLException{
		// select 占쌕뤄옙 占쌘울옙占쏙옙 ?占쏙옙 占쏙옙占쏙옙占� 占쏙옙 占쏙옙占쏙옙
		JSONArray list = new JSONArray();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select ename, uname from education e, hanb_user u where e.unum=u.unum");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				JSONObject bean = new JSONObject();
				bean.put("uname", rs.getString("uname"));
				bean.put("ename", rs.getString("ename"));
				list.add(bean);
			}
		} finally{
			closeAll();
		}	
		return list;
	}

	public JSONArray selectAllStu() throws ClassNotFoundException, SQLException{
		JSONArray ulist = new JSONArray();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select s.enum, u.unum, u.uids, u.uname, s.fir_sub, s.sec_sub, s.thr_sub from hanb_user u, student s where u.unum=s.unum");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JSONObject edto = new JSONObject();
				edto.put("enum", rs.getInt("enum"));
				edto.put("unum", rs.getInt("unum"));
				edto.put("uids", rs.getString("uids"));
				edto.put("uname", rs.getString("uname"));
				edto.put("fir_sub", rs.getString("fir_sub"));
				edto.put("sec_sub", rs.getString("sec_sub"));
				edto.put("thr_sub", rs.getString("thr_sub"));
				ulist.add(edto);
			}
		} finally{
			closeAll();
		}	
		return ulist;
	}

	public JSONObject selectOne(String id, int utype) throws ClassNotFoundException, SQLException{
		JSONObject udto = new JSONObject();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select uids,uname,uemail,uphone,utype from hanb_user where uids=? and utype=?");
			pstmt.setString(1, id);
			pstmt.setInt(2, utype);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				udto = new JSONObject();
				udto.put("uids", rs.getString("uids"));
				udto.put("uname", rs.getString("uname"));
				udto.put("uemail", rs.getString("uemail"));
				udto.put("uphone", rs.getString("uphone"));
				udto.put("utype", rs.getInt("utype"));
			}
		} finally{
			closeAll();
		}	
		return udto;
	}

	public JSONArray selectAllUser() throws ClassNotFoundException, SQLException{
		// select 占쌕뤄옙 占쌘울옙占쏙옙 ?占쏙옙 占쏙옙占쏙옙占� 占쏙옙 占쏙옙占쏙옙
		JSONArray userList = new JSONArray();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select uids,uname,uemail,uphone,utype from hanb_user");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JSONObject udto = new JSONObject();
				udto.put("uids", rs.getString("uids"));
				udto.put("uname", rs.getString("uname"));
				udto.put("uemail", rs.getString("uemail"));
				udto.put("uphone", rs.getString("uphone"));
				udto.put("utype", rs.getInt("utype"));
				userList.add(udto);
			}
		} finally{
			closeAll();
		}	
		return userList;
	}

	public boolean checkId(String id) throws ClassNotFoundException, SQLException{
		boolean result = false;
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(uids) from hanb_user where uids=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("count(uids)") > 0)
					result = true;
			}
		} finally{
			closeAll();
		}	
		return result;
	}

	public JSONArray selectAllStf() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select unum,utype,uname,uemail,uphone from hanb_user where utype>2 and utype<7 ");
			rs = pstmt.executeQuery();
			while(rs.next()){
				JSONObject udto = new JSONObject();
				udto.put("unum", rs.getInt("unum"));
				udto.put("uname", rs.getString("uname"));
				udto.put("utype", rs.getInt("utype"));
				udto.put("uemail", rs.getString("uemail"));
				udto.put("uphone", rs.getString("uphone"));
				list.add(udto);
			}
		}finally{
			closeAll();
		}
		return list;
	}
	
	public JSONArray selectAllStuAtnd() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select u.unum, uids, uname, atdate,st_time,ed_time,state,tcheck from hanb_user u, attendance a where a.state between 0 and 3 and u.unum=a.unum and tcheck=0 and utype=1");
			rs = pstmt.executeQuery();
			while(rs.next()){
				JSONObject udto = new JSONObject();
				udto.put("unum", rs.getInt("unum"));
				udto.put("uids", rs.getString("uids"));
				udto.put("uname", rs.getString("uname"));
				udto.put("atdate", rs.getString("atdate"));
				udto.put("st_time", rs.getString("st_time"));
				udto.put("ed_time", rs.getString("ed_time"));
				udto.put("state", rs.getInt("state"));
				udto.put("tcheck", rs.getInt("tcheck"));
				list.add(udto);
			}
		}finally{
			closeAll();
		}
		return list;
	}
	
}
