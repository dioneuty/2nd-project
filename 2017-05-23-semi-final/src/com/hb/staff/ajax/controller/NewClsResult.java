package com.hb.staff.ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.hb.staff.model.PaDao;
import com.hb.util.DBcon;

@WebServlet("/staff/newcls_result.hb")
public class NewClsResult extends HttpServlet {
	private String ename=" ";
	private String esub1=" ";
	private String esub2=" ";
	private String esub3=" ";
	private String startdate="2017-01-01";
	private String enddate="2017-01-30";
	private int etotalday=0;
	private Integer tchrN;
	private int stnum=0;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		if(req.getParameter("ename")!=null) ename = req.getParameter("ename");
		if(req.getParameter("esub1")!=null) esub1 = req.getParameter("esub1");
		if(req.getParameter("esub2")!=null) esub2 = req.getParameter("esub2");
		if(req.getParameter("esub3")!=null) esub3 = req.getParameter("esub3");	
		startdate = req.getParameter("startdate");
		enddate = req.getParameter("enddate");
		if(new Integer(Integer.parseInt(req.getParameter("etotalday"))) != null) etotalday = Integer.parseInt(req.getParameter("etotalday"));
		if(new Integer(Integer.parseInt(req.getParameter("unum"))) != null) tchrN = new Integer(Integer.parseInt(req.getParameter("unum")));
		if(new Integer(Integer.parseInt(req.getParameter("stnum"))) != null) stnum = Integer.parseInt(req.getParameter("stnum"));
	
		System.out.println(startdate);
		System.out.println(enddate);
		int result = 0;
		
		PaDao dao = new PaDao();
		try{
		result = dao.insertOneCls(ename, esub1, esub2, esub3, startdate, enddate, etotalday, tchrN, stnum);
		//DBcon.commit();
		} catch (ClassNotFoundException e) {
//			try {
//				DBcon.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
			e.printStackTrace();
		} catch (SQLException e) {
//			try {
//				DBcon.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
			e.printStackTrace();
		}
		
		JSONObject jobj1 = new JSONObject();
//		JSONArray jlist1 = new JSONArray();
		JSONObject jobj2 = new JSONObject();
		
//		jobj2.put("result", result);
//		jlist1.add(jobj2);
		jobj1.put("result", result);
		
//		System.out.println(jobj1);
		resp.setContentType("application/json; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jobj1);
		out.close();
		
		/*if(result>0){
			resp.setContentType("text/html; charset=UTF-8"); 
			resp.setCharacterEncoding("UTF-8");
			String msg="<script type=\"text/javascript\">";
			msg+="alert('추가완료했습니다.');";
			msg+="</script>";
			PrintWriter out = resp.getWriter();
			out.println(msg);
			resp.sendRedirect("stf_info.hb");
		}else{
			req.getRequestDispatcher("/err.jsp").forward(req, resp);
		}*/
	}

}
