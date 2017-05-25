package com.hb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.student.model.HomeworkDto;
import com.hb.util.DBcon;

public class BoardDao {
	private static Connection conn = null;
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
		
	public static void closeAll() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
/*	//TODO selectAllNoticeBoard()
	public JSONArray selectAllNoticeboard() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try {
			conn=DBcon.getConnection();
			pstmt = conn.prepareStatement("select n_num, n_sub, uname, n_date, n_cnt from notice");
			rs = pstmt.executeQuery();
			while(rs.next()){
				JSONObject bdto = new JSONObject();
				bdto.put("n_num", rs.getInt("n_num"));
				bdto.put("n_sub", rs.getInt("n_sub"));
				bdto.put("uname", rs.getString("uname"));
				bdto.put("n_date", rs.getString("n_date"));
				bdto.put("n_cnt", rs.getString("n_cnt"));
				list.add(bdto);
			}
		} finally{
			closeAll();
		}
		//System.out.println(list);
		return list;
	}*/
	
	//TODO selectAllNoticeList
	public JSONArray selectAllNoticeList() throws ClassNotFoundException, SQLException{
		JSONArray list = new JSONArray();
		try {
			conn=DBcon.getConnection();
			pstmt = conn.prepareStatement("select n_num, n_sub, unum, n_date, n_cnt, n_content from notice");
			rs = pstmt.executeQuery();
			while(rs.next()){
				JSONObject bdto = new JSONObject();
				bdto.put("n_num", rs.getInt("n_num"));
				bdto.put("n_sub", rs.getString("n_sub"));
				bdto.put("unum", rs.getString("unum"));
				bdto.put("n_date", rs.getString("n_date"));
				bdto.put("n_cnt", rs.getString("n_cnt"));
				list.add(bdto);
			}
		} finally{
			closeAll();
		}
		return list;
	}
	
	//TODO countNoticeRow()
	public int countNoticeRow() throws ClassNotFoundException, SQLException{
		int result=0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(n_num) from notice");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(n_num)");
			}
		} finally{
			closeAll();
		}
		return result;
	}

	// TODO selectAllNewJobs()
	public JSONArray selectAllNewJobs() throws ClassNotFoundException, SQLException {
		JSONArray list=new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select ji_comp,ji_date,ji_recruit,ji_type,ji_enddate,ji_cont from job_info order by ? desc");
			pstmt.setString(1, "ji_num");
			rs = pstmt.executeQuery();
			while( rs.next() ){
				JSONObject jdto = new JSONObject();
				jdto.put("ji_comp", rs.getString("ji_comp"));
				jdto.put("ji_date", rs.getString("ji_date"));
				jdto.put("ji_recruit", rs.getInt("ji_recruit"));	
				jdto.put("ji_type", rs.getString("ji_type"));
				jdto.put("ji_enddate", rs.getString("ji_enddate"));
				jdto.put("ji_cont", rs.getString("ji_cont"));
				list.add(jdto);
			}
		}finally{
			closeAll();
		}
		return list;
	}
	
	public JSONArray selectAllJHmwk() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select hnum, hsub, uname, hcont, hadd_1, hadd_2, hadd_3, hadd_4, hadd_5, hcheck from homework");
			rs = pstmt.executeQuery();
			while( rs.next() ){
				JSONObject jdto = new JSONObject();
				jdto.put("hnum", rs.getInt("hnum"));;
				jdto.put("hsub", rs.getString("hsub"));
				jdto.put("uname", rs.getString("uname"));
				jdto.put("hcont", rs.getString("hcont"));
				jdto.put("hadd_1", rs.getString("hadd_1"));
				jdto.put("hadd_1", rs.getString("hadd_2"));
				jdto.put("hadd_1", rs.getString("hadd_3"));
				jdto.put("hadd_1", rs.getString("hadd_4"));
				jdto.put("hadd_1", rs.getString("hadd_5"));
				jdto.put("hcheck", rs.getInt("hcheck"));
				list.add(jdto);
			}
		}finally{
			closeAll();
		}
		return list;
	}
	
/*	public ArrayList<HomeworkDto> selectAllAHmwk() throws ClassNotFoundException, SQLException {
		ArrayList<HomeworkDto> list = new ArrayList<HomeworkDto>();
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select hnum, hsub, uname, hcont, hadd_1, hadd_2, hadd_3, hadd_4, hadd_5, hcheck from homework");
			rs = pstmt.executeQuery();
			while( rs.next() ){
				HomeworkDto hdto = new HomeworkDto();
				hdto.setHnum(rs.getInt("hnum"));;
				hdto.setHsub(rs.getString("hsub"));
				hdto.setUname(rs.getString("uname"));
				hdto.setHcont(rs.getString("hcont"));
				hdto.setHadd1(rs.getString("hadd_1"));
				hdto.setHadd2(rs.getString("hadd_2"));
				hdto.setHadd3(rs.getString("hadd_3"));
				hdto.setHadd4(rs.getString("hadd_4"));
				hdto.setHadd5(rs.getString("hadd_5"));
				hdto.setHcheck(rs.getInt("hcheck"));
				list.add(hdto);
			}
		}finally{
			closeAll();
		}
		return list;
	}*/
	
	//	TODO count JbntcListRow()
	public int countJbntcRow() throws ClassNotFoundException, SQLException {
		int result=0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(ji_num) from job_info");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(ji_num)");
			}
		} finally{
			closeAll();
		}
		return result;
	}

	public JSONArray selectAllJbCnsltArticles() {
		return null;
	}

	public int countJbCnsltArticleListRow() throws ClassNotFoundException, SQLException {
		int result=0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(ji_num) from job_info");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(ji_num)");
			}
		} finally{
			closeAll();
		}
		return result;
	}

	public JSONArray selectAllSuggestList() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try{
			conn =DBcon.getConnection();
			pstmt= conn.prepareStatement("select regdate,uids,title,cntnt from suggest");
			rs=pstmt.executeQuery();
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("regdate",rs.getString("regdate"));
				obj.put("uids",rs.getString("uids"));
				obj.put("title",rs.getString("title"));
				obj.put("cntnt",rs.getString("cntnt"));
				list.add(obj);
			}
		}finally{
			closeAll();
		}	
		return list;
	}
	
	
	public JSONArray selectAllJobState() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray();
		try{
			conn =DBcon.getConnection();
			pstmt= conn.prepareStatement("select jnum,uname,jsub,jcompany,jfield from job_state");
			rs=pstmt.executeQuery();
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("jnum",rs.getInt("jnum"));
				obj.put("uname",rs.getString("uname"));
				obj.put("jsub",rs.getString("jsub"));
				obj.put("jcompany",rs.getString("jcompany"));
				obj.put("jfield",rs.getString("jfield"));
				list.add(obj);
			}
		}finally{
			closeAll();
		}	
		return list;
	}

	public JSONArray selectAllFreeList() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray ();
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("select num,sub,uname,fdate,cnt,content from freeboard");
			rs=pstmt.executeQuery();
			while(rs.next()){
				JSONObject obj=new JSONObject();
				obj.put("num",rs.getInt("num"));
				obj.put("sub",rs.getString("sub"));
				obj.put("uname",rs.getString("uname"));
				obj.put("fdate",rs.getString("fdate"));
				obj.put("cnt",rs.getInt("cnt"));
				obj.put("content",rs.getString("content"));
				list.add(obj);
			}
		
		}finally{
			closeAll();
		}	
		return list;
	}

	public JSONArray selectAllEpilogueList() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray ();
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("select ep_num,ep_sub,uname,ep_date,ep_cont from epilogue");
			rs=pstmt.executeQuery();
			while(rs.next()){
				JSONObject obj=new JSONObject();
				System.out.println(rs.getInt("ep_num"));
				obj.put("ep_num",rs.getInt("ep_num"));
				obj.put("ep_sub",rs.getString("ep_sub"));
				obj.put("uname",rs.getString("uname"));
				obj.put("ep_date",rs.getString("ep_date"));
				obj.put("ep_cont",rs.getString("ep_cont"));
				list.add(obj);
			}
		
		}finally{
			closeAll();
		}	
		return list;
	}

	public JSONArray selectAllJbCnsltList() throws ClassNotFoundException, SQLException {
		JSONArray list = new JSONArray ();
		//날짜,글번호,글쓴이,제목,내용
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("select fdate,num,uname,sub,content from job_consultant");
			rs=pstmt.executeQuery();
			while(rs.next()){
				JSONObject obj=new JSONObject();
				obj.put("fdate",rs.getString("fdate"));
				obj.put("num",rs.getInt("num"));
				obj.put("uname",rs.getString("uname"));
				obj.put("sub",rs.getString("sub"));
				obj.put("content",rs.getString("content"));
				list.add(obj);
			}
		}finally{
			closeAll();
		}	
		return list;
	}
	
	public int countHmwkRow() throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(hnum) from homework");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(hnum)");
			}
		} finally{
			closeAll();
		}
		return result;
	}
	
	public int countFreeboardRow() throws ClassNotFoundException, SQLException {
		int result=0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(num) from freeboard");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(num)");
			}
		} finally{
			closeAll();
		}
		return result;
	}

	public int countEpilogueRow() throws ClassNotFoundException, SQLException {
		int result=0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(ep_num) from epilogue");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(ep_num)");
			}
		} finally{
			closeAll();
		}
		return result;
	}

	public int countJobstateRow() throws ClassNotFoundException, SQLException {
		int result=0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(jnum) from job_state");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(jnum)");
			}
		} finally{
			closeAll();
		}
		return result;
	}

	public int countSuggestRow() throws ClassNotFoundException, SQLException {
		int result=0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(idx) from suggest");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(idx)");
			}
		} finally{
			closeAll();
		}
		return result;
	}
	
	public int countJbCnsltRow() throws ClassNotFoundException, SQLException {
		int result=0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("select count(num) from job_consultant");
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getInt("count(num)");
			}
		} finally{
			closeAll();
		}
		return result;
	}
	
	//TODO insertSuggest
	public int insertSuggest(int utype, String id, String title, String sgstext) throws ClassNotFoundException, SQLException{
		int result = 0;
		try {
			conn=DBcon.getConnection();
			//conn.setAutoCommit(false);
			pstmt = conn.prepareStatement("insert into suggest(idx,utype,uids,wpw,title,regdate,cntnt) values (suggest_seq.nextVal,?,?,?,?,sysdate,?)");
			pstmt.setInt(1,utype);
			pstmt.setString(2, id);
			pstmt.setString(3, "1");//wpw// 기능 임시로 비활성화
			pstmt.setString(4, title);
			pstmt.setString(5, sgstext);
			result = pstmt.executeUpdate();
			//conn.commit();
		} finally{
			closeAll();
		}
		return result;
	}
	
	public int insertOneFree(String id, int utype, String uids, String title, String cont) throws ClassNotFoundException, SQLException {
		int result=0;
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("insert into freeboard(num,sub,uname,fdate,cnt,content) values(free_seq.nextVal,?,?,sysdate,?,?)");
			pstmt.setString(1,title);
			pstmt.setString(2,uids);
			pstmt.setInt(3,0);
			pstmt.setString(4,cont);
			result=pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;	
	}	
		
	/*	num        NUMBER            NOT NULL, 
	    sub        VARCHAR2(90)      DEFAULT '제목없음', 
	    uname      VARCHAR2(40)      NOT NULL, 
	    fdate       DATE              DEFAULT sysdate, 
	    cnt        NUMBER            DEFAULT 0, 
	    content    VARCHA*/
	
	public int insertJobNotice(String id, int utype, int ji_num, String ji_comp, String ji_area, int ji_recruit, String ji_type, String ji_enddate, String ji_date, String ji_pay, String ji_phone, String ji_cont) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement("insert into job_info values(?,?,?,?,?,?,to_date(?, 'yyyy-mm-dd'),?,?,?)");
			pstmt.setInt(1, ji_num);
			pstmt.setString(2, ji_comp);
			pstmt.setString(3, ji_area);
			pstmt.setInt(4, ji_recruit);
			pstmt.setString(5, ji_type);
			pstmt.setString(6, ji_enddate);
			pstmt.setString(7, ji_date);
			pstmt.setString(8, ji_pay);
			pstmt.setString(9, ji_phone);
			pstmt.setString(10, ji_cont);
			result = pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}

	public int insertNotice(int utype, String id, String pw, String title, String sgstext) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("insert into notice(n_num,n_sub,unum,n_date,n_cnt,n_content) values(free_seq.nextVal,?,?,sysdate,?,?)");
			pstmt.setString(1,title);
			pstmt.setString(2,id);
			pstmt.setInt(3,0);
			pstmt.setString(4,sgstext);
			result=pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
		
		
		/*  n_num        NUMBER            NOT NULL, 
		    n_sub        VARCHAR2(90)      DEFAULT '제목없음', 
		    uname        VARCHAR2(15)      NOT NULL, 
		    n_date       DATE              DEFAULT sysdate, 
		    n_cnt        NUMBER            DEFAULT 0, 
		    n_content    VARCHAR2(1024)    DEFAULT '내용없음', 
		    
		    notice
		    SEQUENCE notice_SEQ
		*/
		
	}

	public int insertOneEpil(String id, int utype, String uname, String title, String cont) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("insert into epilogue (ep_num,ep_sub,ep_cont,uname,ep_date) values(epilogue_seq.nextVal,?,?,?,sysdate)");
			pstmt.setString(1,title);
			pstmt.setString(2,cont);
			pstmt.setString(3,uname);
			result=pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}

	public int insertOneJbCnslt(String id, int utype, String uname, String title, String cont) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("insert into job_consultant (num,sub,uids,uname,fdate,cnt,content) values(jobcnslt_seq.nextVal,?,?,(select uname from hanb_user where uids=?),sysdate,?,?)");
			pstmt.setString(1,title);
			pstmt.setString(2,id);
			pstmt.setString(3,id);
			pstmt.setInt(4, 0);
			pstmt.setString(5, cont);
			result=pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}

	public int insertOneJbState(String uname, String jsub, String jcompany, String jfield) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("insert into job_state (jnum,uname,jsub,jcompany,jfield) values(job_state_SEQ.nextVal,?,?,?,?)");
			pstmt.setString(1,uname);
			pstmt.setString(2,jsub);
			pstmt.setString(3,jcompany);
			pstmt.setString(4, jfield);
			result=pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}



	public int updateChkHmwk(int hnum) throws ClassNotFoundException, SQLException {
		int result = 0;
		try{
			conn=DBcon.getConnection();
			pstmt=conn.prepareStatement("update homework set hcheck=? where hnum=?");
			pstmt.setInt(1,2);
			pstmt.setInt(2, hnum);
			result=pstmt.executeUpdate();
		}finally{
			closeAll();
		}
		return result;
	}



	






	
	

	

	

	

	
	
/*	idx number primary key,
	utype number not null,
	uids varchar2(12) not null,
	wpw varchar2(15) not null,
	title varchar2(40),
	regdate date default sysdate not null,
	cntnt clob*/
}
